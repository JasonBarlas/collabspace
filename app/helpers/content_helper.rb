module ContentHelper
  def content_display_partial_path(content_option, dashboard)
    if content_option == "new"
      { partial: "content/content_display/new_display", locals: { new_post: dashboard[:new_post], categories: dashboard[:categories] } }
    elsif content_option == "posts"
      { partial: "content/content_display/posts_display", locals: { posts: dashboard[:posts] } }
    elsif content_option == "filters"
      { partial: "content/content_display/filters_display", locals: { categories: dashboard[:categories] } }
    elsif content_option == "chats"
      "content/content_display/chats_display"
    elsif content_option == "friends"
      { partial: "content/content_display/friends_display", locals: { new_friendship: dashboard[:new_friendship], friends: dashboard[:friends], non_friends: dashboard[:non_friends] } }
    elsif content_option == "profile"
      "content/content_display/profile_display"
    else
      "content/content_display/default_display"
    end
  end
end
