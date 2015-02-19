# Controls the default route
class DefaultController < ApplicationController
  def index
    FlickRaw.api_key = ENV['FLICKR_API_KEY'] 
    FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
    photo = flickr.photos.search(text: 'tomatoes', per_page: 1).first
    info = flickr.photos.getInfo(photo_id: photo.id)
    @tomato_url = FlickRaw.url_b(info)
  end
end
