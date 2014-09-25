class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  	require 'net/http'
	def facebook_likes
  		uri = URI("http://graph.facebook.com/radcircle?fields=likes")
  		data = Net::HTTP.get(uri)
  		JSON.parse(data)['likes']
	end
end
