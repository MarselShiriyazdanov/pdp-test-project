class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments

  validates :full_name, presence: true

  has_attachment :avatar
end
