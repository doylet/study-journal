class TagsController < ApplicationController
    before_action :require_login

    def index
        @tags = Tag.all
        @titles = Article.distinct.pluck(:title)
        @articles = Article.all
    end
    
    def show
        @tag = Tag.find(params[:id])
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

    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_url # halts request cycle
        end
    end
end
