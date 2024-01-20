# app/models/like.rb
class Like < ApplicationRecord
    belongs_to :user
    belongs_to :question, optional: true
    belongs_to :comment, optional: true
    belongs_to :feedback, optional: true
  end