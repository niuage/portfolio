class Project < Struct.new(:title, :subtitle, :description, :category, :image_fname, :id, :button_copy)
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  DATA = [
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
      "Crowdsourced shipping.",
      "Chances are, a member is already headed that way, anyway.",
      "website",
      "spaceship.png",
      "spaceship",
      "Launch"
    ],
    [
      "Why I love Devpost",
      "A one-page site showing what it's like to be a developer at Devpost.",
      "And why you will too.",
      "website",
      "devpost_love.png",
      "love-devpost",
      "Come visit"
    ]
  ]

  def self.all
    DATA.map { |data| new(*data) }
  end

  def self.find(title)
    data = DATA.find { |data| data[0].parameterize == title }
    return nil unless data

    new(*data)
  end

  def to_param
    title.parameterize
  end

  def logo_url
    "logos/#{image_fname}"
  end

  def image_url
    "projects/#{image_fname}"
  end

  def bg_image_url
    "project_bgs/#{id}.svg"
  end
end
