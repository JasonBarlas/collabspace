class PagesController < ApplicationController
  def index
    @content_option = params[:content_option] || "posts"
    @dashboard = Dashboard::DashboardService.new(current_user, params).call
  end
end
