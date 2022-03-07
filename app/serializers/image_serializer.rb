class ImageSerializer
  def self.image(image)
    {
      "data": {
        "id": nil,
        "type": "image",
        "attributes": {
          "image": {
            "height": image.height,
            "width": image.width,
            "location": image.location,
            "image_url": image.url,
            "author": image.author
            }
          }
        }
      }
  end

end
