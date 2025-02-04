module ContentHelper
  def content_display_partial_path(content_option, posts = nil, new_post = nil)
    if content_option == "new"
      { partial: "content/content_display/new_display", locals: { new_post: new_post } }
    elsif content_option == "posts"
      { partial: "content/content_display/posts_display", locals: { posts: posts } }
    elsif content_option == "filters"
      "content/content_display/filters_display"
    elsif content_option == "chats"
      "content/content_display/chats_display"
    elsif content_option == "friends"
      "content/content_display/friends_display"
    elsif content_option == "profile"
      "content/content_display/profile_display"
    else
      "content/content_display/default_display"
    end
  end
end
