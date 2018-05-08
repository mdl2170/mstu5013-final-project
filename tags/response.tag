<response>
  <div class="send_message" onclick="{ sendMsg }">
    <div class="icon"></div>
    <div class="text">{ response.text }</div>
    <input show={ response.needInput } ref="answer" type="text" placeholder=" ">
  </div>
  <script>

    // this.x = "hide";

    // console.log(this.response)
    //
    // this.on('mount', function(event){
    //   this.x = "";
    // });

    sendMsg(e) {

      console.dir(e.target);

      if (e.target.tagName == "INPUT") {
        console.log('STOP PROP');
        e.stopPropagation();
        return;
      }

      var msgID = this.parent.sessionRef.push().key;

      if (e.item.response.needInput == true) {
        var usersAnswer = this.refs.answer.value;
        var msg = {
          id: msgID,
          text : e.item.response.text + usersAnswer,
          type : "user-created",
          score : e.item.response.score
        }

        this.parent.currentScriptedMsgID = e.item.response.next;
        this.parent.sessionRef.child(msgID).set(msg);
      }else{

        var msg = {
          id: msgID,
          text : e.item.response.text,
          type : "user-created",
          score : e.item.response.score
        }

        this.parent.currentScriptedMsgID = e.item.response.next;
        this.parent.sessionRef.child(msgID).set(msg);
      }
    }
  </script>

</response>
