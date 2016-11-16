class Forum < ActiveRecord::Base
	has_many :answers
	belongs_to :user
	searchkick

	paginates_per 20
end
