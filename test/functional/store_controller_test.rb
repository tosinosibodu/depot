require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', :minimum=>6
    assert_select '#main .item', 3
    assert_select 'h3', 'Blue Shirt'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
