class Publishers::WebsitesController < Publishers::ApplicationController
  def index
    @websites = current_publisher.websites
  end
end
