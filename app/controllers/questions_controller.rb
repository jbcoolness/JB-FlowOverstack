class QuestionsController < ApplicationController
  def index
    @questions = Question.all
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





  private
  def question_params
    params.require(:question).permit(:user_id, :title, :content)
  end

end
