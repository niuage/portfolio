module V2
  class ProjectsController < V2::ApplicationController
    def show
      @project = Project.find(params[:id])
    end
  end
end
