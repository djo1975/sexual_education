# app/models/journal.rb
class Journal < ApplicationRecord
    belongs_to :user
    has_many :comments
  end