class LabsController < ApplicationController
  def index
    @LaboratiryWorks=Lab.all
  end
  def show
    @LaboratiryWork=Lab.find(params[:id])
  end
  def new
    @LaboratiryWork=Lab.new
  end
  def create
    lab=Lab.new(params.require(:lab).permit(:title,:description))
    lab.user_id=1
    if lab.save
      redirect_to root_path
    else
      redirect_to root_path
      flash[:DANGER] = "Laboratiry Work was not created! "
    end
  end
  def edit
    @LaboratiryWork=Lab.find(params[:id])
  end
  def update
    @LaboratiryWork=Lab.find(params[:id])
    @LaboratiryWork.update(params.require(:lab).permit(:title,:description))
    redirect_to root_url
  end
  def destroy
    @LaboratiryWork=Lab.find(params[:id])
    @LaboratiryWork.destroy
    redirect_to root_url
  end
  def mark
    @LaboratiryWork=Lab.find(params[:id])
  end
  def grade
    @LaboratiryWork=Lab.find(params[:id])
    if @LaboratiryWork.update(params.permit(:grade))
    redirect_to root_url
    else
      render :mark
      end
  end
end
