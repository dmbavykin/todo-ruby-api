# frozen_string_literal: true

module Api
  class ProjectsController < ApplicationController
    before_action :authenticate_api_user!
    load_and_authorize_resource

    def index
      render json: @projects, each_serializer: Api::ProjectSerializer
    end

    def create
      @project = current_api_user.projects.create(project_params)
      if @project.valid?
        render json: @project, serializer: Api::ProjectSerializer, status: :created
      else
        render status: :unprocessable_entity
      end
    end

    def show
      @project = Project.find_by(id: params[:id])
      render json: @project, serializer: Api::ProjectSerializer
    end

    def update
      @project = Project.find_by(id: params[:id])
      @project.update(project_params)
      if @project.valid?
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
