class Api:: ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  def destroy
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
