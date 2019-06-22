class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable

  def self.search(search)
    search ? where(['title LIKE ?', "%#{search}%"]) : all
  end

end
