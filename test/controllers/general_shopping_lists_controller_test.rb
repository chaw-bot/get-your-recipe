require 'test_helper'

class GeneralShoppingListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get general_shopping_lists_index_url
    assert_response :success
  end
end
