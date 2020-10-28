class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plants
  has_many :likes
  has_many :commrnts
  has_many :trees

  has_many :followed, class_name:"Follow", foreign_key:"followed_id",dependent: :destroy  #フォロー取得
  has_many :follower, class_name:"Follow", foreign_key:"follower_id",dependent: :destroy  #フォロワー取得
  has_many :followed_user , through: :follower, source: :followed  #自分がフォローしてるユーザー
  has_many :following_user, through: :followed, source: :follower  #自分のことをフォローしてるユーザー

  validates_uniqueness_of :email  #メールアドレスの重複防止
  validates :name, length: { in: 2..10 }
  validates :introduction, length: { maximum: 200 }

  attachment :image

  def following?(user)
    followed_user.include?(user)
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
end
