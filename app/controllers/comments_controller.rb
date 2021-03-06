class CommentsController < ApplicationController
  http_basic_authenticate_with name:"dhh", password:"secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
    #也可使用下面的方式删除
    # @comment = Comment.find(params[:id])
    # @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
