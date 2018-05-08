<response>
  <div class="send_message" onclick="{ sendMsg }">
    <div class="icon"></div>
    <div class="text">{ response.text }</div>
    <input class= {x} ref="answer" type="text" placeholder="____________">
  </div>
  <script>
  this.x = "hide"
      sendMsg(e) {
      var msgID = this.parent.sessionRef.push().key;
      if(e.item.response.needInput == true){
        this.x = "";
        var usersAnswer = this.refs.answer.value;
      }
      var msg = {
        id: msgID,
        text : e.item.response.text + usersAnswer,
        type : "user-created",
        score : e.item.response.score
      }
      this.parent.currentScriptedMsgID = e.item.response.next;
      this.parent.sessionRef.child(msgID).set(msg);
    }
  </script>
</response>
