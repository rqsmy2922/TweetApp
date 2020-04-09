class User < ApplicationRecord
  authenticates_with_sorcery!
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 4..24 }
  validates :display_name, length: { maximum: 20 }
  validates :plofile, length: { maximum: 200  }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { in: 6..24 }, if: :password
  validates :password_confirmation, presence: true, if: :password 
end
