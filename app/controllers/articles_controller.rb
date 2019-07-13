# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :current_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path,
                  flash: { notice: 'Article was successfully created.' }
    else
      render :new,
             flash: { error: @article.errors.full_messages.to_sentence }
    end
  end

  def show; end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id),
                  flash: { notice: 'Article updated.' }
    else
      render :edit,
             flash: { error: @article.errors.full_messages.to_sentence }
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path,
                  flash: { notice: 'Article deleted.' }
    else
      redirect_to article_path(@article.id),
                  flash: { error: @article.errors.full_messages.to_sentence }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :topic_id, :user_id)
  end

  def current_article
    @article = Article.find(params[:id])
  end
end
