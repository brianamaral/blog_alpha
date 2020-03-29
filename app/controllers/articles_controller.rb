class ArticlesController < ApplicationController

before_action :set_article,only:[:edit,:update,:destroy,:show]

    def index
        @articles = Article.all
    end

    def new
        require_user
        @article = Article.new      
    end

    def edit
        if set_article.user != current_user
            redirect_to root_path,message:"Only the owner of the article can perform this action"
        end
    end

    def update
        if @article.user == current_user
            if @article.update article_params
                flash[:notice] = "Article was sucessfully updated!"
                redirect_to article_path(@article)
            else
                render 'edit'
            end
        end
    end

    def create 
        @article = Article.new article_params
        @article.user = current_user
        @article.save
        if @article.save  
            redirect_to article_path(@article)
            flash[:notice] = "Article was sucessfully created"
        else
            render 'new'
        end    
    end

    def show
        
    end

    def destroy
        
        @article.destroy
        flash[:notice] = "article was successfully deleted"

        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description) 
    end
end