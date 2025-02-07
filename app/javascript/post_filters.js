document.addEventListener('turbo:load', function () {
  const userHash = {};
  const categoryHash = {};

  const usernamesInput = document.getElementById("usernames");
  const categoriesSelect = document.getElementById("categories");
  const titleInput = document.getElementById("title");
  const addUserButton = document.getElementById("add-user");
  const addCategoryButton = document.getElementById("add-category");
  const resultLink = document.getElementById("result-link");

  const userList = document.getElementById("user-list");
  const categoryList = document.getElementById("category-list");

  if (!addUserButton || !addCategoryButton || !resultLink || !usernamesInput || !categoriesSelect || !titleInput) {
    return;
  }

  addUserButton.addEventListener("click", () => {
    const username = usernamesInput.value.trim();
    if (username && !userHash[username]) {
      userHash[username] = true;

      const li = document.createElement("li");
      li.textContent = username;
      userList.appendChild(li);
      usernamesInput.value = "";

      updateLink();
    }
  });

  addCategoryButton.addEventListener("click", () => {
    const category = categoriesSelect.value;
    if (category && !categoryHash[category]) {
      categoryHash[category] = true;

      const li = document.createElement("li");
      li.textContent = category;
      categoryList.appendChild(li);

      updateLink();
    }
  });

  function updateLink() {
    const usernames = Object.keys(userHash);
    const categories = Object.keys(categoryHash);
    const title = titleInput.value.trim();

    resultLink.href = `/pages?content_option=posts&usernames=${JSON.stringify(usernames)}&categories=${JSON.stringify(categories)}&title=${encodeURIComponent(title)}`;
  }

  titleInput.addEventListener("input", updateLink);
});
