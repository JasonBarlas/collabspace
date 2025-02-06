class PagesController < ApplicationController
  def index
    @content_option = filter_params[:content_option] || "posts"
    @dashboard = Dashboard::DashboardService.new(current_user, filter_params).call
  end

  private

  def filter_params
    permitted = params.permit(:content_option, :title, :usernames, :categories)

    permitted[:usernames] = JSON.parse(permitted[:usernames]) rescue [] if permitted[:usernames].is_a?(String)
    permitted[:categories] = JSON.parse(permitted[:categories]) rescue [] if permitted[:categories].is_a?(String)

    permitted[:usernames] ||= []
    permitted[:categories] ||= []

    permitted
  end
end
