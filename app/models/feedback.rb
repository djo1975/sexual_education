# app/models/feedback.rb
class Feedback < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :comments, as: :commentable
  
    validates :content, presence: true
  end
  