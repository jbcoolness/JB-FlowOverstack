class AnswersController < ApplicationController
  # before_action :set_answer, except: [:create]
  # before_action :set_question, only: [:create, :edit]
  

  
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user    
  
    respond_to do |format|  
    
      if @answer.save
        format.html { redirect_to question_path(@question), notice: 'Answer was successfully created.'}
        format.js
        #format.json {render :show, status: :created, location: @answer }
        
      else
        format.html { redirect_to question_path(@question), alert: 'Error, please try again.'}
        #format.json { render json: @answer.errors, status: :unprocessable_entity }
        #flash[:alert] = "Error, try again"
        #render :show
        
      end 
    
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
