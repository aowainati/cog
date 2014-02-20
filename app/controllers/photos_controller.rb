class PhotosController < ApplicationController
  def index
    @photo = Photo.random
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "success"
      redirect_to @photo
    else
      flash[:alert] = "wtf"
      redirect_to new_photo_path
    end
  end

  def show
    @photo = Photo.find_by_encrypted_key(params[:id])
  rescue ActiveRecord::RecordNotFound
    @photo = nil
  end

  def destroy

  end

  def coming
    @photo = Photo.find_by_encrypted_key(params[:id]).increment!(:coming_count)
    redirect_to photos_path
  end

  def going
    @photo = Photo.find_by_encrypted_key(params[:id]).increment!(:going_count)
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:image_file)
  end
end
