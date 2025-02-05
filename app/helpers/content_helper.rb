module ContentHelper
  def content_display_partial_path(content_option, new_post = nil, categories = nil, posts = nil, new_friendship = nil, friends = nil, non_friends = nil)
    if content_option == "new"
      { partial: "content/content_display/new_display", locals: { new_post: new_post, categories: categories } }
    elsif content_option == "posts"
      { partial: "content/content_display/posts_display", locals: { posts: posts } }
    elsif content_option == "filters"
      "content/content_display/filters_display"
    elsif content_option == "chats"
      "content/content_display/chats_display"
    elsif content_option == "friends"
      { partial: "content/content_display/friends_display", locals: { new_friendship: new_friendship, friends: friends, non_friends: non_friends } }
    elsif content_option == "profile"
      "content/content_display/profile_display"
    else
      "content/content_display/default_display"
    end
  end
end
