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
    app.responses = [];
    app.currentScriptedMsgID = "01";
    var sessionID = dialogRef.push().key;
    app.sessionRef = dialogRef.child(sessionID);

    //Retrieve scripted messages
    scriptedMsgRef.once("value", function(snapshot) {
      var data = snapshot.val();
      app.scriptedMsg = data;
      loadScriptedMsg();
    });

    // Start chat. Load the first scripted message and save it to the dialog.
    // Set currentScriptedMsgID to the next message
    function loadScriptedMsg() {
      var msg = app.scriptedMsg[app.currentScriptedMsgID];
      if (msg.response == "nill")
        app.responses = [];
      else
        app.responses = msg.response;
      app.currentScriptedMsgID = msg.next;
      app.sessionRef.push(msg);
    }

    // This will be called after the scripted message loaded.
    app.sessionRef.on("value", function(snapshot) {
      var data = snapshot.val();
      app.messages = [];
      for (key in data)
        app.messages.push(data[key]);

      // currentScriptedMsgID == nill means we don't know what the next message would be yet.
      // The next message will be decided from the response option that user chooses.
      if(app.currentScriptedMsgID != "nill")
        loadScriptedMsg();

      app.update();
    });

  </script>
</app>
