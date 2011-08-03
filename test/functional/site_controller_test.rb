require 'test_helper'

class SiteControllerTest < ActionController::TestCase

  test "show with empty id parameter should redirect to index welcome" do
    get :show 
    assert_redirected_to welcome_index_path
  end

  test "site with non-existing site as parameter should redirect to index welcome" do
    get(:show, {'id' => "0"})
    assert_redirected_to welcome_index_path
  end
  
  test "show with id parameter of existing site should return success" do
    get(:show, {'id' => "1"})
    assert_response :success
  end

end
