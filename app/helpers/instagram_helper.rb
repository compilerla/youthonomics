module InstagramHelper
  def instagram_photos
    api_key = ENV['INSTAGRAM_API_TOKEN']
    feed = JSON.parse(RestClient.get("https://api.instagram.com/v1/users/1921107209/media/recent/?client_id=39100473c9834b84b5c1c3a560e60945", { accept: :json }))
    return feed.to_json.html_safe
  end
end
