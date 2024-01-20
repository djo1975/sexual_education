class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question, optional: true
  belongs_to :journal, optional: true
  has_many :likes
  belongs_to :feedback, optional: true

  validates :content, presence: true
end
