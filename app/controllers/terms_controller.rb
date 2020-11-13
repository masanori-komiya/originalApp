class TermsController < ApplicationController
  before_action :require_user_logged_in
  def new
    @term = Term.new
  end
  
  def index
    @terms = Term.order(id: :desc).page(params[:page]).per(3)
  end
  
  def show
    @term = Term.find(params[:id])
  end

  
  def create
    @term = Term.new(term_params)
    if @term.save!
      flash[:success] = 'term が正常に登録されました'
      redirect_to action: 'index'
    else
      flash[:danger] = 'termが登録されませんでした'
      render 'terms/new'
    end
  end
  
  private
  
  def term_params
    params.require(:term).permit(:start_date, :end_date)
  end
  
end
