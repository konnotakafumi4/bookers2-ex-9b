class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :title, presence:true
  validates :body, presence:true,length:{maximum:200}
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id) #favorites(お気に入り)が実在しているか？（user.id)
  end
end
