class AnswersController < ApplicationController
  # before_action :set_answer, except: [:create]
  # before_action :set_question, only: [:create, :edit]
  

  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.user = current_user    
  
    if @answer.save
      flash[:notice] = 'Answer was successfully created.'
      redirect_to question_path(@question)
    else
      flash[:alert] = "Error, try again"
      render :show
    end 
  end






  private

  # def set_answer
  #   @answer = Answer.find(params[:id])
  # end

  # def set_question
  #   @question = Question.find(params[:question_id])
  # end

  def answer_params
    params.require(:answer).permit(:content)
  end

end
