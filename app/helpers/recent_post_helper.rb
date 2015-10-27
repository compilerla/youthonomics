module RecentPostHelper
  def recent_post
    #info = comfy_blog_post_path(@cms_site.path, @blog.path, post.slug)
    # info = Comfy::Blog::Post::comfy_blog_post_path(@cms_site.path, @blog.path, post.slug)
    # feed = JSON.parse(RestClient.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=#{api_key}", { accept: :json }))
    # return info.to_json.html_safe
    puts "Hello World!"
  end
end
