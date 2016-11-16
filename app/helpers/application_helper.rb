module ApplicationHelper
	def striphtml(text)
		filtered = text.gsub(/\<.*?\>/, "")
		nbspfiltered = filtered.gsub("&nbsp;", "")
		return nbspfiltered
	end
end
