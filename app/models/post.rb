class Post < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

	belongs_to :user

	has_many :post_categories
	has_many :categories, through: :post_categories

	has_many :comments

	has_many :votes, as: :voteable

	validates :title, presence: true
	validates :url, presence: true

	def total_votes
		self.votes.where(vote: true).size - self.votes.where(vote: false).size
	end
end