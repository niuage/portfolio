class Image
  attr_accessor :project, :filename, :caption, :type

  def initialize(project, filename, caption, type)
    @project = project
    @filename = filename
    @caption = caption
    @type = type
  end

  def path
    "#{project.to_param}/details/#{filename}"
  end

  def to_partial_path
    "images/image.html.erb"
  end
end
