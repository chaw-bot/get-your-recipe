require 'rails_helper'

RSpec.describe 'Home page', type: :request do
  before(:each) do
    @user = User.create!(name: 'Moh', email: 'moh@mail.com', password: '123456')
    login_as @user
  end

  describe 'home page' do
    it 'should display the home page' do
      get users_url
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response).to include('Get Your Recipe')
    end
  end
end
