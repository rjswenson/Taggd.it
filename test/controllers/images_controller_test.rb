require "test_helper"

describe ImagesController do

  before do
    @image = images(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must show image" do
    get :show, id: @image
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @image
    assert_response :success
  end

  it "must destroy image" do
    assert_difference('Image.count', -1) do
      delete :destroy, id: @image
    end

    assert_redirected_to images_path
  end

end
