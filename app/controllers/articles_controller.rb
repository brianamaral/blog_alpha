class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new 
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update article_params
            flash[:notice] = "Article was sucessfully updated!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def create 
        @article = Article.new article_params
        @article.save
        if @article.save  
            redirect_to article_path(@article)
            flash[:notice] = "Article was sucessfully created"
        else
            render 'new'
        end    
    end

    def show
        @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "article was successfully deleted"

        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title,:description) 
    end
end