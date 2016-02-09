class Article < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	searchkick
	has_paper_trail
end
