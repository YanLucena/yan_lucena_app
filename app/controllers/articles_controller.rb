class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Your article was succesfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:notice] = "Your article was successfully deleted"
            redirect_to articles_path
        else
            flash[:notice]  = "Something prevented your article to be deleted"
        end
    end
        
    private
        def article_params
           params.require(:article).permit(:title, :description) 
        end
    
end