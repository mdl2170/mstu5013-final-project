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
      <!-- <div class="message_input_wrapper">
        <input class="message_input" placeholder="Type your message here..." ref="inputMessage"/>
      </div> -->
      <response each="{ response in responses }"></response>
    </div>
  </div>
  <div class="message_template">
    <li class="message">
      <div class="avatar"></div>
      <div class="text_wrapper">
        <div class="text"></div>
      </div>
    </li>
  </div>

  <script>
    var app = this;
    app.scriptedMsg = [];
    app.messages = [];
    app.reponses = [];
    app.currentScriptedMsgID = "001";
    var sessionID = dialogRef.push().key;
    app.sessionRef = dialogRef.child(sessionID);

    //Retrieve scripted messages
    scriptedMsgRef.once("value", function(snapshot) {
      var data = snapshot.val();
      // for (key in data)
      //   app.scriptedMsg.push(data[key]);
      app.scriptedMsg = data;
      loadScriptedMsg();
    });

    //Start chat
    function loadScriptedMsg() {
      var msg = app.scriptedMsg[app.currentScriptedMsgID];
      app.currentScriptedMsgID = msg.next;
      app.sessionRef.push(msg);
    }

    app.sessionRef.on("value", function(snapshot) {
      var data = snapshot.val();
      app.messages = [];
      for (key in data)
        app.messages.push(data[key]);

      app.responses = app.scriptedMsg[app.currentScriptedMsgID].response;

      if(app.scriptedMsg[app.currentScriptedMsgID].response != "nill")
        loadScriptedMsg();

      app.update();
    });

  </script>
</app>
