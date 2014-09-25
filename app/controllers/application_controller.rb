class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  	def page_title
  		if @title 
  			@title + " | Radcircle"
  		else 
  			"Radcircle"
  		end
  	end

  	def radcircle_member
  		if current_user.role == "standard" || !current_user.role
  			false
  		else 
  			true
  		end
  	end

  	helper_method :radcircle_member
  	helper_method :page_title 

  	require 'net/http'
	def facebook_likes
  		uri = URI("http://graph.facebook.com/Radcircle?fields=likes")
  		data = Net::HTTP.get(uri)
  		JSON.parse(data)['likes']
	end
end
