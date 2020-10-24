class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plants
  has_many :likes
  has_many :commrnts

  has_many :followed, class_name:"Follow", foreign_key:"followed_id",dependent: :destroy  #フォロー取得
  has_many :follower, class_name:"Follow", foreign_key:"follower_id",dependent: :destroy  #フォロワー取得
  has_many :followed_user, through: :followed, source: :follower  #自分のことをフォローしてるユーザー
  has_many :following_user, through: :follower, source: :followed  #自分がフォローしてるユーザー

  validates_uniqueness_of :email
  validates :name, length: { in: 2..10 }
  validates :introduction, length: { maximum: 200 }
end
