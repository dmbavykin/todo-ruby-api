# frozen_string_literal: true

module Api
  class ProjectsController < ApplicationController
    before_action :authenticate_api_user!
    load_and_authorize_resource through: :current_api_user, only: %i[index create]
    load_and_authorize_resource only: %i[show update destroy]

    def index
      render json: @projects.includes(:todos), each_serializer: Api::ProjectSerializer
    end

    def create
      if @project.save
        render json: @project, serializer: Api::ProjectSerializer, status: :created
      else
        render status: :unprocessable_entity
      end
    end

    def show
      render json: @project, serializer: Api::ProjectSerializer
    end

    def update
      if @project.update(project_params)
        render json: @project, serializer: Api::ProjectSerializer, status: :ok
      else
        render status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
      render status: :ok
    end

    private

    def project_params
      params.permit(:title)
    end
  end
end
