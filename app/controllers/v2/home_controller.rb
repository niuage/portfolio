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
        ],
        [
          "Spaceship",
          "A better way to send your packages.",
          "website",
          "spaceship.png",
          "spaceship"
        ],
        [
          "Work at Devpost",
          "A one-page site showcasing the dev life at Devpost.",
          "website",
          "love_devpost.png",
          "love-devpost"
        ]
      ]

      @projects = projects_data.map { |d| project_class.new(*d) }
    end
  end
end
