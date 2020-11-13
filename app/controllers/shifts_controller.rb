class ShiftsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @shifts = Shift.where(term_id: params[:term_id]).order("day").order("kind")
    @shift = Shift.new
    @term = Term.find(params[:term_id])
  end
  
  def create
    @term = Term.find(params[:term_id])
    @shift = current_user.shifts.build(shift_params)
    if @shift.save!
      flash[:success] = '登録されました'
      redirect_to action: 'index'
    else
      flash[:danger] = '登録されませんでした'
      render 'shifts/index'
    end
  end
  
  def destroy
    @shift = Shift.find(params[:id])
    if @shift.present?
      @shift.destroy
    end
    flash[:success] = '削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def shift_params
    params.require(:shift).permit(:term_id, :day, :kind)
  end
end
