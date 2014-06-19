class Publishers::ApplicationController < ApplicationController
  before_action :authenticate_publisher!
  layout 'publishers'
end
