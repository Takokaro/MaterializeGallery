class GalleriesController < ApplicationController
  before_action :find_gallery, except: [:index, :new, :create]

  def index
    @galleries = Gallery.all
  end

  def show
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = "Successfully created gallery."
      redirect_to @gallery
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:notice] = "Successfully updated gallery."
      redirect_to @gallery
    else
      render action: 'edit'
    end
  end

  def destroy
    @gallery.destroy
    flash[:notice] = "Successfully destroyed gallery."
    redirect_to @gallery
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name)
  end 

end
