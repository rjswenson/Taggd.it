require "test_helper"

describe CommentsController do
  it "should get show" do
    get :show
    assert_response :success
  end

  it "should get index" do
    get :index
    assert_response :success
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should get edit" do
    get :edit
    assert_response :success
  end

end
