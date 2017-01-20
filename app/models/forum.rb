class Forum < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	belongs_to :user
	searchkick

	paginates_per 20
end
