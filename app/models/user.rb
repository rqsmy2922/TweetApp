class User < ApplicationRecord
  authenticates_with_sorcery!
  
  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :inverse_followers, through: :follows, dependent: :destroy
  has_many :inverse_follows, foreign_key: :inverse_follower_id, dependent: :destroy, class_name: "Follow"
  has_many :followers, through: :inverse_follows, dependent: :destroy
  
  mount_uploader :icon, IconUploader
  serialize :icon, JSON
  
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 4..24 }
  validates :display_name, presence: true, length: { in: 1..15 }
  validates :bio, length: { maximum: 140  }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..24 }, if: :password
  validates :password_confirmation, presence: true, if: :password
  
  def followed_by? user
    inverse_follows.where(follower_id: user.id).exists?
  end
  
  def favorited_by? user
    favorites.where(user_id: user.id).exists?
  end
end
