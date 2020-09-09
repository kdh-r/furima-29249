class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i, message: 'Include both letters and numbers' }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: 'Full-width katakana characters'}
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/, message: 'Full-width katakana characters'}
  validates :birthday, presence: true
end
