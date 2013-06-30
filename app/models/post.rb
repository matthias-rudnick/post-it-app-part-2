class Post < ActiveRecord::Base
	include Voteable
	extend FriendlyId
  friendly_id :title, use: :slugged

	belongs_to :user

	has_many :post_categories
	has_many :categories, through: :post_categories

	has_many :comments

	has_many :votes, as: :voteable

	validates :title, presence: true
	validates :url, presence: true

end