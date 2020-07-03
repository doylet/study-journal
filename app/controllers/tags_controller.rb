class TagsController < ApplicationController
    before_action :course, only: [:show, :edit, :update, :destory]

    def index
        @tags = course.tags.distinct
        # @titles = Article.distinct.pluck(:title)
        # @articles = Article.all
    end
    
    def show
        @course = course
        @tag = @course.tags.find(params[:id])
    end

    def edit
        @tag = Tag.find(params[:id])    
    end

    def update
        respond_to do |format|
            if @tag.update(tag_params)
            format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
            format.json { render :show, status: :ok, location: @tag }
            else
            format.html { render :edit }
            format.json { render json: @tag.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @tag.destroy
    end

    private
    # Only allow a list of trusted parameters through.
    def tag_params
        params.require(:tag).permit(:name)
    end

    def articles
        @articles = Article.all
    end

    def course
        @course ||= Course.find(params[:course_id])
    end
end
