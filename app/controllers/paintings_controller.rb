class PaintingsController < ApplicationController
  before_action :find_painting, except: [:index, :new, :create]

  def new
    @painting = Painting.new(gallery_id: params[:gallery_id])
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      flash[:notice] = "Successfully created painting."
      redirect_to galleries_path(@painting)
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @painting.update(painting_params)
      flash[:notice] = "Successfully updated painting."
      redirect_to galleries_path(@painting)
    else
      render action: 'edit'
    end
  end

  def destroy
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to galleries_path(@painting)
  end

  def find_painting
    @painting = Painting.find(params[:id])
  end

  def painting_params
    params.require(:painting).permit(:gallery_id, :name, :image, :remote_image_url, galleries_attributes: [:gallery_id])
  end

end
