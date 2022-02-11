require 'rails_helper'

describe 'Recipe Index Page', type: :feature do
  before(:each) do
    visit user_session_path
    @user1 = User.create!(
      name: 'john', email: 'john@test.com', password: 'john123'
    )
    fill_in 'Email', with: 'john@test.com'
    fill_in 'Password', with: 'john123'
    click_button 'Log in'

    @recipe1 = @user1.recipes.create!(
      name: 'Pizza', preparation_time: 25, cooking_time: 120,
      description: 'Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple.',
      public: true
    )

    visit recipes_path
  end

  describe 'I can see' do
    it 'a recipe\'s title.' do
      expect(page).to have_content 'Hawaiian Pizza'
    end

    it 'a recipe\'s description' do
      expect(page).to have_content 'Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple.'
    end

    it 'the REMOVE recipe button' do
      expect(page).to have_link 'REMOVE'
    end

    it 'when I click on a recipe, it redirects me to that recipe\'s show page.' do
      click_link 'Hawaiian Pizza'
      expect(page).to have_current_path(recipe_path(@recipe1))
    end
  end
end