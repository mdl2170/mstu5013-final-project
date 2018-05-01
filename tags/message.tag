<message id="{ msg.id }">
  <li class="message left typing hidden" if="{ msg.type == 'scripted' }">
    <div class="avatar"></div>
    <div class="text_wrapper">
      <div class="text">Typing...</div>
    </div>
  </li>
  <li class="message left msg" if="{ msg.type == 'scripted' }">
    <div class="avatar"></div>
    <div class="text_wrapper">
      <div class="text">{ msg.text }</div>
    </div>
    <div class="message_media" if="{ msg.media != 'nill' }">
      <img src="{ msg.media }" alt="" class="img-responsive">
    </div>
  </li>
  <li class="message right" if="{ msg.type == 'user-created' }">
    <div class="avatar"></div>
    <div class="text_wrapper">
      <div class="text">{ msg.text }</div>
    </div>
  </li>

  <script>
    var $messages = $('.messages');
    $messages.animate({
      scrollTop: $messages.prop('scrollHeight')
    }, 300);
  </script>

</message>
