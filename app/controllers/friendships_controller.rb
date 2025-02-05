class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friendship_params)
    if @friendship.save
      flash[:notice] = "Friend added successfully."
      redirect_to pages_path(content_option: "friends")
    else
      flash[:alert] = "Unable to add friend. Please try again."
      redirect_to pages_path(content_option: "friends")
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
