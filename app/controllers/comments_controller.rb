class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    #this line tells that the "@post" variable to make sure the post has the ID that we are referring to and then have the "@comment" variable 
    #be connected to the @post variable and have the comments be created while following the requirements under "comment_params" method
    
    if @post.comments.create(comment_params)
      redirect_to @post,
      notice: "Comment was successfully created!"
    else
      redirect_to @post,
      alert: "There was an error when creating the comment"
    end
  end
  
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to @post}
      format.json { head :no_content }
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:author, :body, :email_address)
  end
end
