module V2
  class HomeController < V2::ApplicationController
    def index
      project_class = Struct.new(:title, :subtitle, :description, :category, :image_url, :id, :button_copy)

      projects_data = [
        [
          "HackerPond",
          "Developers, designers, product, UX... We're all hackers!",
          "Complete redesign of the old Devpost homepage, with a pond theme. Just because.",
          "website",
          "frog.png",
          "frog",
          "Jump in"
        ],
        [
          "Benefitsy",
          "Find the good in food.",
          "Benefitsy's a simple way to learn about the health benefits of fruits, vegetables and herbs.",
          "website",
          "lemon.png",
          "benefitsy",
          "Take a bite"
        ],
        [
          "Spaceship",
          "Ship anything, anywhere.",
          "Chances are, a member is already headed that way, anyway.",
          "website",
          "spaceship.png",
          "spaceship",
          "Launch"
        ],
        [
          "Why I love Devpost",
          "And why you will too.",
          "A one-page site showcasing the dev life at Devpost.",
          "website",
          "devpost_love.png",
          "love-devpost",
          "Come visit"
        ]
      ]

      @projects = projects_data.map { |d| project_class.new(*d) }
    end
  end
end
