class AnswersController < ApplicationController
  # before_action :set_answer, except: [:create]
  # before_action :set_question, only: [:create, :update, :destroy]
  

  
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
        format.js        
      end     
    end    
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html {redirect_to question_path(@question) }
      format.js
    end    
  end






  private

  # def set_question
  #   @question = Question.find(params[:question_id])
  # end

  # def set_answer
  #   @answer = @question.answers.find(params[:id])
  # end

  def answer_params
    params.require(:answer).permit(:content)
  end

end
