class Publishers::WebsitesController < ApplicationController
  def index
    @websites = current_publisher.websites
  end
end
