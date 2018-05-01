<app>
  <div class="chat_window">
    <div class="top_menu">
      <div class="buttons">
        <div class="button close"></div>
        <div class="button minimize"></div>
        <div class="button maximize"></div>
      </div>
      <div class="title">Chat</div>
    </div>
    <ul class="messages">
      <message each="{ msg in messages }"></message>
    </ul>
    <div class="bottom_wrapper clearfix">
      <!-- <div class="message_input_wrapper"> <input class="message_input" placeholder="Type your message here..." ref="inputMessage"/> </div> -->
      <response each="{ response in responses }"></response>
    </div>
  </div>

  <script>
    var app = this;
    app.scriptedMsg = [];
    app.messages = [];
    app.responses = [];
    app.currentScriptedMsgID = "01";
    var sessionID = dialogRef.push().key;
    app.sessionRef = dialogRef.child(sessionID);
    app.score = 0;

    //Retrieve scripted messages
    scriptedMsgRef.once("value", function (snapshot) {
      var data = snapshot.val();
      app.scriptedMsg = data;
      loadScriptedMsg();
    });

    // Start chat. Load the first scripted message and save it to the dialog. Set currentScriptedMsgID to the next message
    function loadScriptedMsg() {
      var msg = app.scriptedMsg[app.currentScriptedMsgID];

      var msgID = app.sessionRef.push().key;
      msg.id = msgID;

      if (msg.response == "nill")
        app.responses = [];
      else
        app.responses = msg.response;

      app.currentScriptedMsgID = msg.next;
      app.sessionRef.child(msgID).set(msg);
    }

    // This will be called after the scripted message loaded.
    app.sessionRef.on("value", function (snapshot) {
      var data = snapshot.val();
      app.messages = [];
      for (key in data)
      {
        app.messages.push(data[key]);
        if(data[key].type == "user-created")
        app.score += data[key].score;
      }

      console.log(app.score);

      // currentScriptedMsgID == nill means we don't know what the next message would be yet. The next message will be decided from the response option that user chooses.
      if (app.currentScriptedMsgID != "nill")
        {
          loadScriptedMsg();
      app.update();
    }
      else {
        alert("If you want to learn more about cybersecurity, please visit: https://www.dhs.gov/publication/stopthinkconnect-student-resources");
      }
    });

    app.on('update', function () {
      var lastMessage = app.messages[app.messages.length - 1];
      var $message = $('#' + lastMessage.id + ' .msg');

      $('#' + lastMessage.id + ' .typing').removeClass('hidden');
      anime({
        targets: '#' + lastMessage.id + ' .typing .text',
        opacity: 0.2,
        duration: 500,
        loop: true,
        direction: 'reverse'
      });

      var delay = lastMessage.text.length * 50;
      $message.addClass('hidden');
      setTimeout(function () {
        $('#' + lastMessage.id + ' .typing').addClass('hidden');
        $message.removeClass('hidden');
      }, delay);
    });
  </script>
</app>
