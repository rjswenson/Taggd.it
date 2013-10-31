class ProfileController < ApplicationController
before_filter :authenticate_user!
  def index
    @images = Image.all
  end

  def show
    @user = User.find(request.original_url.split('/').last)
    @images = @user.images
  end
end
