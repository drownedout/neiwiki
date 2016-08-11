class Forum < ActiveRecord::Base
	has_many :answers
	belongs_to :user
	searchkick
end
