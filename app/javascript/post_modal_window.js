document.addEventListener('turbo:load', function () {
    const readPostButtons = document.querySelectorAll('.read-post-btn');
    const modal = document.getElementById('post-modal');

    if (!modal) {
        console.warn('Modal not found in the DOM');
        return;
    }

    const modalTitle = modal.querySelector('#modal-title');
    const modalContent = modal.querySelector('#modal-content');

    if (readPostButtons.length === 0) {
        console.warn('No "Read Post" buttons found');
    }

    readPostButtons.forEach((button) => {
        button.addEventListener('click', function () {
            const postId = this.dataset.id;

            fetch(`/posts/${postId}`)
                .then((response) => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! Status: ${response.status}`);
                    }
                    return response.json();
                })
                .then((data) => {
                    modalTitle.textContent = data.title;
                    modalContent.textContent = data.content;
                    modal.classList.remove('hidden');
                })
                .catch((error) => console.error('Error fetching post:', error));
        });
    });

    modal.addEventListener('click', function (e) {
        if (e.target === modal) {
            modal.classList.add('hidden');
        }
    });

    const closeButton = document.getElementById('close-modal');
    if (closeButton) {
        closeButton.addEventListener('click', function () {
            modal.classList.add('hidden');
        });
    }

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' && !modal.classList.contains('hidden')) {
            modal.classList.add('hidden');
        }
    });
});
