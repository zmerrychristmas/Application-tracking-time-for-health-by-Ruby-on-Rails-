class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :user_sleeps
  has_many :friends
  scope :friend_list, -> (id) {
    where(id: (Friend.select(:user_id).where(user_friend_id: id).pluck(:user_id) + Friend.select(:user_friend_id).where(user_id: id).pluck(:user_friend_id)))
  }
  # has_many :friend_sleeps, through: :friends
  def jwt_payload
    super.merge('foo' => 'bar')
  end
end
