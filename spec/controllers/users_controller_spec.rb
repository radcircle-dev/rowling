require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "POST #create" do
    it "makes the first user an admin" do
      post :create, user: { name: 'Frederick First User', email: 'sample@sample.com',
                            password: 'password' }
      expect( User.last.role ).to eq "admin"
    end

    it "subsequent users are standard users" do
      User.create(name: 'Frederick First User', email: 'sample@sample.com',
                      password: 'password') 
      post :create, user: { name: 'Sammy Second User', email: 'sample2@sample.com',
                            password: 'password' }
      expect( User.last.role ).to eq "standard"
    end
  end

end
