class Comment < ActiveRecord::Base
	include Voteable
	
	belongs_to :post
	belongs_to :user

	has_many :votes, as: :voteable

	validates :comment_text, presence: true

end