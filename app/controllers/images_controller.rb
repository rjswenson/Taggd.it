class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index]

  def vote
    value = params[:type] == "up" ? 1 : -1
    @image = Image.find(params[:id])
    @image.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back
  end

  def index
    @images = Image.order("created_at DESC").to_a
    @image  = Image.new
  end

  # def top
  #   This sorts by votes

  #   image_ids = ActiveRecord::Base.connection.execute("SELECT target_id FROM rs_reputations WHERE target_type = 'Image' ORDER BY value DESC")
  #   image_ids = image_ids.map { |item| item = item[0] }
  #   @images = []
  #   image_ids.each { |id| @images << Image.find(id) }
  #   @image = Image.new
  # end

  def show
    @user = User.find(@image.user_id)
  end


  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to images_path , notice: 'Image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @image }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.'}
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :location, :user_id, :image)
    end
end
