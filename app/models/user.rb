class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments, dependent: :destroy
  has_many :forums
  has_many :answers, dependent: :destroy
  validates_acceptance_of :terms, acceptance: true, message: "You must accept the terms and conditons to use the NEI Wiki"

	has_attached_file :profile_picture, styles: { medium: "500x500#", small: "100x100#" }, :default_url => lambda { |avatar| avatar.instance.set_default_url}
  validates_attachment_content_type :profile_picture, :content_type => /\Aimage\/.*\Z/

  def full_name
		return firstname + " " + lastname
	end

  def set_default_url
    ActionController::Base.helpers.asset_path('default-avatar.png')
  end
  
end
