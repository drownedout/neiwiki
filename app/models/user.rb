class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments
  has_many :forums
  validates_acceptance_of :terms, acceptance: true, message: "You must accept the terms and conditons to use the NEI Wiki"
  
end
