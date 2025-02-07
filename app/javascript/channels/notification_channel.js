import consumer from "channels/consumer"

document.addEventListener('turbo:load', function() {

  const currentChatroom = document.getElementById("chatroom-id").dataset.chatroomId;
  if (!currentChatroom) {
    return;
  }

  consumer.subscriptions.create("NotificationChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      if (String(data.chatroom_id) !== String(currentChatroom)) {
        alert(data.notification);
      }
    }
  });
});
