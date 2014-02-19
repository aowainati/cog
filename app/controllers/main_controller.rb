class MainController < ApplicationController
  def index
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(params[:photo])
  end
end
