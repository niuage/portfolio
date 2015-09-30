class Category
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def self.all
    @all ||= I18n.t("categories").map { |cat| new(cat) }
  end

  def self.find_all(names)
    all.select { |cat| cat.name.in? names }
  end

  def element
    @element ||= name.first(2).capitalize
  end

  def to_partial_path
    "categories/category"
  end
end
