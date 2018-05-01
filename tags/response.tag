<response>
  <div class="send_message" onclick="{ sendMsg }">
    <div class="icon"></div>
    <div class="text">{ response.text }</div>
  </div>
  <script>
    sendMsg(e) {
      var msgID = this.parent.sessionRef.push().key;

      var msg = {
        id: msgID,
        text : e.item.response.text,
        type : "user-created",
        score : e.item.response.score
      }
      this.parent.currentScriptedMsgID = e.item.response.next;
      this.parent.sessionRef.child(msgID).set(msg);
    }
  </script>
</response>
