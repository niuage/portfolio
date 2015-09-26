module V2
  class HomeController < V2::ApplicationController
    def index
      project_class = Struct.new(:title, :description, :category, :image_url, :id)

      projects_data = [
        [
          "HackerPond",
          "Complete redesign of the old Devpost homepage, with a pond theme.",
          "website",
          "frog.png",
          "frog"
        ],
        [
          "Benefitsy",
          "Find the good in food.",
          "website",
          "lemon.png",
          "benefitsy"
        ]
      ]

      @projects = projects_data.map { |d| project_class.new(*d) }
    end
  end
end
