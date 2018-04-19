# frozen_string_literal: true

module Api
  class TodosController < ApplicationController
    before_action :authenticate_api_user!
    load_and_authorize_resource :project
    load_and_authorize_resource through: :project, only: :create
    load_and_authorize_resource only: %i[show update destroy]

    def create
      if @todo.save
        render json: @todo, serializer: Api::TodoSerializer, status: :created
      else
        render status: :unprocessable_entity
      end
    end

    def show
      render json: @todo, serializer: Api::TodoSerializer
    end

    def update
      if @todo.save
        render json: @todo, serializer: Api::TodoSerializer, status: :ok
      else
        render status: :unprocessable_entity
      end
    end

    def destroy
      @todo.destroy
      render status: :ok
    end

    private

    def todo_params
      params.permit(:content, :order, :is_done, :expiration_date)
    end
  end
end
