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
		if post.documentet && post.documentet.attachmentet?
			html << link_to(@post.documentet.attachmentet_file_name, @post.documentet.attachmentet.url)
			return html.html_safe
		end
	end

	def post_foto_link (post)
		html = ""
		if post.documentet && post.documentet.attachmentet?
			html << post.documentet.attachmentet.url
			return html.html_safe
		end
	end



end
