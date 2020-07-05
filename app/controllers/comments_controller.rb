class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :destroy]
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        @comment.save

        redirect_to course_article_path(@comment.article.course, @comment.article)
    end

    def destroy
        @comment.destroy
    end

    private
    def set_comment
        @comment = article.comment.find(params[:id])
    end
    def comment_params 
        params.require(:comment).permit(:author_name, :body, :image)
    end
end
