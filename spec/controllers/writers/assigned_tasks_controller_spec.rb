require 'spec_helper'

describe Writers::AssignedTasksController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
