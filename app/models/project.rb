class Project < Struct.new(:title, :subtitle, :description, :category, :image_url, :id, :button_copy)
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

  def self.find(name)
    name = name.downcase
    data = DATA.find { |data| data[0].downcase = name }
    return nil unless data

    new(*data)
  end
end
