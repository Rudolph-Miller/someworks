class Editors::ApplicationController < ApplicationController
  before_action :authenticate_editor!
  layout 'editors'
end
