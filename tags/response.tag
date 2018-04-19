<response>
  <div class="send_message" onclick="{ sendMsg }">
    <div class="icon"></div>
    <div class="text">{ response.text }</div>
  </div>
  <script>
    sendMsg(e) {
      var msg = {
        text : e.item.response.text,
        type : "user-created"
      }
      this.parent.currentScriptedMsgID = e.item.response.next;
      this.parent.sessionRef.push(msg);
    }
  </script>
</response>
