class CommentsController < ApplicationController

    def create
        @parent = comment_type
        @commet = @parent.comments.new(comment_params)    

        respond_to do |format|
            if @comment.save
                format.html { redirect_to question_path(@parent.question_id) } if @commentable_type == 'Answer'
                format.html { redirect_to quesion_path(@parent) } if @commentable_type == 'Question'
                format.js
            else
                format.html {'questions/show'}
                flash[:error] = 'Error, comment not added'
            end
        end
    end




    private


    def comment_type
        if params[:question_id]
            Question.find([:question_id])
        else
            Answer.find([:answer_id])
        end    
    end

    def comment_params
        params.require(:commet).permit(:content).merge(user_id: current_user.id)    
    end

end
