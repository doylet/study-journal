class AuthorSessionsController < ApplicationController
    def new
    end

    def create
        if login(params[:email], params[:password])
            redirect_back_or_to(root_path, notice: 'Logged in success')
        else
            flash.now.alert = "Login failed"
            render action: :new
        end
    end

    def destroy
        logout
        redirect_to(:tags, otice: 'Logged out!')
    end
end
