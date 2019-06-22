class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def index
    @questions = Question.search(params[:search]).order(created_at: :DESC)
  end

  def new
    @question = Question.new
    @question.user = current_user
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    
    if @question.save
      flash[:notice] = "Pregunta creada correctamente"
      redirect_to root_path
    else
      render :new
    end  
  end


  def show
    
  end





  private

  def set_question
    @question = Question.find(params[:id])
  end


  def question_params
    params.require(:question).permit(:user_id, :title, :content)
  end

end
