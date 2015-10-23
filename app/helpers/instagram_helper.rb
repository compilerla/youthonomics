module InstagramHelper
  def instagram_photos
    JSON.parse(RestClient.get('https://api.instagram.com/v1/users/1921107209/media/recent/?client_id=39100473c9834b84b5c1c3a560e60945', { accept: :json }))['data'].each do |image|
      if image['tags'].include?('thecrew')
        link_to image['link'] do
          image_tag(image['images']['standard_resolution']['url'])
        end
      end
    end
  end
end
