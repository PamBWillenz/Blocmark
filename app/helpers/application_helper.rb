require 'embedly'
require 'json'

module ApplicationHelper

  def display(url)
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'], :user_agent => 'Mozilla/5.0 (compatible; blocmark/1.0; pam@positek.net)'
    obj = embedly_api.oembed :url => url
    #obj.first.html_safe
    # (obj.first.thumbnail_url).html_safe
    # json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    obj[0].marshal_dump
  end

end
