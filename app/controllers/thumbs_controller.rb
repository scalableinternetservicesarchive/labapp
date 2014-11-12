class ThumbsController < ApplicationController
  def index
    @thumbs = Thumb.all
  end

  def show
    @thumb = Thumb.find(params[:id])
  end

  def new
    @thumb = Thumb.new
  end

  def create
    @thumb = Thumb.new(params.require(:thumb).permit(:name, :path))
    if @thumb.save
      redirect_to @thumb, notice: 'Thumb was successfully created.'
    else
      render :new
    end
  end
end
