class ArticlesController < ApplicationController
  before_action :course, only: [:show, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = course.articles
  end

  # GET /course/:id/articles/1
  # GET /course/:id/articles/1.json
  def show
    @course
    # @articles = course.articles.find(params[:id])
    @comment = Comment.new()
    @comment.article_id = @article.id
  end

  # GET /articles/new
  def new
    @article = course.articles.new
  end
  
  # GET course/:course_id/articles/1/edit
  def edit
    @article = course.articles.find(params[:id])
    # @article.course_id = params[:id]
    @comment = Comment.new()
    @comment.article_id = @article.id
  end

  # POST /courses/1/articles
  # POST /articles.json
  def create
    @article = course.articles.new(article_params)
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to course_articles_path(@course, @article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to course_article_path(course, @article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@course), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = course.articles.find(params[:id])
    end

    def course
      @course ||= Course.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :subject, :question, :answer, :tag_list, :course_id, :image)
    end
end
