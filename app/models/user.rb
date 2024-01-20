# app/models/user.rb
class User < ApplicationRecord
    has_many :comments
    has_many :journals
    has_many :likes
    has_many :questions

    validates :email, presence: true, uniqueness: true
  end