class ProfileController < ApplicationController
before_filter :authenticate_user!
def index
  @images = Image.all
end

end
