document.addEventListener('turbo:load', function() {
  const flashMessages = document.querySelectorAll('#flash-message');
  console.log(flashMessages); // Check if the elements are selected

  flashMessages.forEach((message) => {
    // Add opacity transition
    setTimeout(() => {
      message.classList.add('opacity-0');
    }, 3000); // Fade out after 3 seconds

    // Remove the message after fade
    setTimeout(() => {
      message.remove();
    }, 3500); // Remove after 3.5 seconds
  });
});
