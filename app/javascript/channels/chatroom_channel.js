import consumer from "channels/consumer";

const chatroomIdElement = document.getElementById('chatroom-id');
const messageInput = document.getElementById('message-input');
const messageContainer = document.getElementById('messages-container');
const sendButton = document.getElementById('send-button');

if (!chatroomIdElement || !messageInput || !messageContainer || !sendButton) {
  console.error("Chatroom elements not found. Ensure your HTML is correctly structured.");
} else {
  const chatroomId = chatroomIdElement.dataset.chatroomId;
  const userIdElement = document.getElementById('user-id');

  if (!userIdElement) {
    console.error("User ID element not found. Ensure your HTML includes the user ID as a dataset.");
  } else {
    const userId = userIdElement.dataset.userId;

    if (!userId || !chatroomId) {
      console.error("User ID or Chatroom ID is missing. Check your HTML dataset attributes.");
    } else {
      const chatroomChannel = consumer.subscriptions.create(
        { channel: "ChatroomChannel", chatroom_id: chatroomId },
        {
          connected() {
            console.log(`Connected to ChatroomChannel for chatroom ${chatroomId}`);
          },

          disconnected() {
            console.log(`Disconnected from ChatroomChannel for chatroom ${chatroomId}`);
          },

          received(data) {
            const messageElement = document.createElement('div');
            messageElement.textContent = `${data.user_id}: ${data.message}`;
            messageContainer.appendChild(messageElement);
          },

          rejected() {
            alert("You are not authorized to access this chatroom.");
            window.location.href = "/";
          },

          sendMessage() {
            const message = messageInput.value.trim();

            if (message !== '') {
              this.perform('send_message', { message: message, user_id: userId });
              messageInput.value = '';
            }
          }
        }
      );

      sendButton.addEventListener('click', () => {
        chatroomChannel.sendMessage();
      });

      messageInput.addEventListener('keypress', (event) => {
        if (event.key === 'Enter') {
          chatroomChannel.sendMessage();
        }
      });
    }
  }
}
