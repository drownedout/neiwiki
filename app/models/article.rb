class Article < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300#", small: "100x100#" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	
  	has_attached_file :document
	validates_attachment :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
  	
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories
	has_many :comments, dependent: :destroy
	searchkick
	has_paper_trail

	paginates_per 20
end
