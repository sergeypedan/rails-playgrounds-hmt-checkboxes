# frozen_string_literal: true

class ArticlesController < ApplicationController

  before_action :assign_resource, only: [:edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    render :edit
  end

  def create
    @article = Article.new(filtered_params)
    if @article.save
      redirect_to articles_path
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @article.update(filtered_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def filtered_params
    params.require(:article)
          .permit(
            :title,
            { tag_ids: [] }
          )
  end

  def assign_resource
    @article = Article.find params[:id]
  end

end
