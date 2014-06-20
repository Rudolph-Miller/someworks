class Writers::ApplicationController < ApplicationController
  before_action :authenticate_writer!
  layout 'writers'
end
