class ArticlesController < ApplicationController
    def new
        @article = Article.new 
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

    private

    def article_params
        params.require(:article).permit(:title,:description) 
    end
end