module ArticlesHelper
    def article_params
        params.require(:article).permit(:title, :subject, :question, :answer, :tag_list)
    end
end
