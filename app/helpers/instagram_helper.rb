module InstagramHelper
  def instagram_photos
    api_key = ENV['INSTAGRAM_API_TOKEN']
    feed = JSON.parse(RestClient.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{api_key}", { accept: :json }))
    return feed.to_json.html_safe
  end
end
