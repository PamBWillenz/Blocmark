module ApplicationHelper
  require 'embedly'
  require 'json'
  def display(url)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY']
    obj = embedly_api.oembed :url => url
    #obj.first.html_safe
    (obj.first.thumbnail_url).html_safe
  end

end
