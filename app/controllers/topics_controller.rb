# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :current_topic, only: %i[show edit update destroy]
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to topics_path,
                  flash: { notice: 'topic was successfully created.' }
    else
      render :new,
             flash: { error: @topic.errors.full_messages.to_sentence }
    end
  end

  def show; end

  def edit; end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic.id),
                  flash: { notice: 'topic updated.' }
    else
      render :edit
    end
  end

  def destroy
    if @topic.destroy
      redirect_to topics_path,
                  flash: { notice: 'topic deleted.' }
    else
      redirect_to topic_path(@topic.id),
                  flash: { error: @topic.errors.full_messages.to_sentence }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description)
  end

  def current_topic
    @topic = Topic.find(params[:id])
  end
end
