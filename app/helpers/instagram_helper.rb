module InstagramHelper
  def instagram_photos
    api_key = ENV['INSTAGRAM_API_TOKEN']
    feed = []
    return feed.to_json.html_safe
  end
end
