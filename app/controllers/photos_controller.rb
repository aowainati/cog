class PhotosController < ApplicationController
  def index

  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo created!"
      redirect_to @photo
    else
      render :action => 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy

  end

  private

  def photo_params
    params.require(:photo).permit(:image_file)
  end
end
