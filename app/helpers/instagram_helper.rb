module InstagramHelper
  def instagram_photos
    api_key = ENV['INSTAGRAM_API_TOKEN']
    JSON.parse(RestClient.get('https://api.instagram.com/v1/users/self/media/recent/?access_token=#{api_key}', { accept: :json }))['data'].each do |image|
      if image['tags'].include?('youthonomics')
        link_to image['link'] do
          image_tag(image['images']['standard_resolution']['url'])
        end
      end
    end
  end
end
