# frozen_string_literal: true

class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    render :edit
  end

  def create
    @tag = Tag.new(filtered_params)
    if @tag.save
      redirect_to tags_path
    else
      render :edit
    end
  end

  private

  def filtered_params
    params.require(:tag)
          .permit(:name)
  end

end
