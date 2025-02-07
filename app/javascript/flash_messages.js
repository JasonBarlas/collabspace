document.addEventListener('turbo:load', function() {
  const flashMessages = document.querySelectorAll('#flash-message');

  flashMessages.forEach((message) => {
    setTimeout(() => {
      message.classList.add('opacity-0');
    }, 3000);

    setTimeout(() => {
      message.remove();
    }, 3500);
  });
});
