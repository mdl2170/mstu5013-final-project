<scorereport>

  <script>
    <button type="button" onclick={ toggleStateA }>Score</button>

  <pre>
    this.StateA = { stateA ? "Good" : "Bad" };


  </pre>

    <script>


     console.log('THIS TAG', this);

     this.stateA = true;

     this.toggleStateA = function(event){
       this.stateA = !this.stateA;
     };
    </script>


</scorereport>
