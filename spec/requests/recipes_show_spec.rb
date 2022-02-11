require 'rails_helper'

RSpec.describe 'Recipe Show Page', type: :feature do
  before(:each) do
    visit user_session_path
    @user1 = User.create!(name: 'John Doe', email: 'john@gmail.com', password: 'john123', confirmed_at: Time.now)

    fill_in 'Email', with: 'john@gmail.com'
    fill_in 'Password', with: 'john123'
    click_button 'Log in'

    @recipe1 = @user1.recipes.create!(
      name: 'Pizza', preparation_time: 11, cooking_time: 23,
      description: 'description of Pizza combines pizza sauce, cheese, cooked ham, and pineapple.',
      public: true
    )

    @food1 = @user1.foods.create!(name: 'Apple', price: 4, measurement_unit: 'kg')

    visit recipe_path(@recipe1)
    expect(page).to have_current_path(recipe_path(@recipe1))
  end

  describe 'I can see' do
    it 'a recipe\'s title.' do
      expect(page).to have_content 'Pizza'
    end

    it 'a link to the general shopping list' do
      expect(page).to have_link 'Generate shopping list'
    end

    it 'test clicking the "Generate shopping list" link redirects me to the shopping list.' do
      click_button 'Generate shopping list'
      expect(page).to have_current_path general_shopping_lists_path(@recipe1)
    end
  end
end
