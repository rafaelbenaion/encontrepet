module ApplicationHelper
	
	def flash_class (type)
		case type
		when 'alert'
			"alert-danger"
		when 'notice'
			"alert-success"
		else
			"alert-warning"
		end
	end

	def post_foto (post)
		html = ""
		if post.image 
			html << link_to(@post.image_file_name, @post.image.url)
			return html.html_safe
		end
	end




end
