module V2
  class HomeController < V2::ApplicationController
    def index
      @projects = Project.all
    end
  end
end
