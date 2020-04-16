require 'test_helper'

class FavoritePetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_pets_index_url
    assert_response :success
  end

end
