class Project
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :id,
    :title,
    :subtitle,
    :description,
    :images,
    :categories,
    :button

  def initialize(project_data)
    project_data.each do |attr, value|
      self.send(:"#{attr}=", value)
    end
    @images ||= []
    @categories ||= []
  end

  def categories=(categories)
    @categories = Category.find_all(categories)
  end

  def images=(images)
    @images = images.map do |image|
      Image.new(self, *image)
    end
  end

  def self.all
    @all ||= I18n.t(:projects).map { |name, project_data| new(project_data) }
  end

  def self.find(title)
    all.find { |project| project.to_param == title }
  end

  def to_param
    title.parameterize
  end

  def logo_url
    "logos/#{id}.png"
  end

  def image_url
    "projects/#{id}.png"
  end

  def bg_image_url
    "project_bgs/#{id}.svg"
  end
end
