class Image
  attr_reader :height, :width, :location, :url, :author

  def initialize(data)
    @height = data[:height]
    @width = data[:width]
    @location = data[:location]
    @url = data[:url]
    @author = data[:author]
  end
end
