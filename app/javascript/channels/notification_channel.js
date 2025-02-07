import consumer from "channels/consumer"

document.addEventListener('turbo:load', function() {

  consumer.subscriptions.create("NotificationChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const currentChatroom = document.getElementById("chatroom-id");
      if (currentChatroom) {
        const currentChatroomId = currentChatroom.dataset.chatroomId;
        console.log(String(data.chatroom_id) + String(currentChatroomId));
        if (String(data.chatroom_id) === String(currentChatroomId)) {
          console.log("return");
          return;
        }
      }
      alert(data.notification);
    }
  });
});
