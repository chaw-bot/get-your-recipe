require 'rails_helper'

RSpec.feature 'food index page', js: true, type: :feature do
  background do
    visit user_session_path
    @user1 = User.create!(name: 'John Doe', email: 'john@gmail.com', password: 'john123', confirmed_at: Time.now)
    fill_in 'Email', with: 'john@gmail.com'
    fill_in 'Password', with: 'john123'
    click_button 'Log in'

    visit foods_path

    click_button 'Add Food'

    visit new_food_path

    @food1 = @user1.foods.create!(name: 'Apple', price: 350, measurement_unit: 'unit')

    click_button 'submit'

    visit foods_path
  end

  it 'should include the added food' do
    expect(page).to have_content 'Apple'
    expect(page).to have_content 350
    expect(page).to have_content 'unit'
  end
end
