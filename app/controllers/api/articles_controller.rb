class Api:: ArticlesController < ApplicationController
  def index
    articles=Article.all
    render json: articles, status:200
  end

  def show
    article= Article.find_by(id: params[:id])
    if article
      render json: article, status: 200
    else
      render json:{
        error:"Article not found"
      }
    end
  end

  def update
    article= Article.find_by(id: params[:id])
    if article
      article.update(title: params[:title],body: params[:body],author: params[:author])
      render json: "Article was updated successfully"
    else
      render json: {
        error: "Article Not Found"
      }
    end
  end

  def destroy
    article= Article.find_by(id:params[:id])
    if article
      article.destroy
      render json: "Article was deleted successfully"
    else
      render json: {
        error: "Article Not Found"
      }
    end
  end
  def create
    article=Article.new(
      title:article_params[:title],
      body: article_params[:body],
      author: article_params[:author]
    )
    if article.save
          render json: article,status: 200
    else
      render json: {
        error: "Error creating"
      }
    end
  end
  private
    def article_params
      params.require(:article).permit( [:title, :body,:author])
    end
  end
