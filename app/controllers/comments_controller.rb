class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @note=Note.find(params[:note_id])
    @comment = @note.comments.build(params[:comment])
    @comment.user= current_user
    @comment.save
    respond_to do |format|
      format.html {     if @comment.save
                          redirect_to @note, notice:  "Reply added"
                        else
                          redirect_to @note, notice:  "Reply added failed"
                        end}
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @note = @comment.note
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end
end
