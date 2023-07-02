class Friend < ApplicationRecord
    belongs_to :user
    validates :user, presence: true, if: -> { user_id.present? }
    validates :user_id, uniqueness: { scope: :user_friend_id }
    validate :user_id_other_than_user_friend_id

  private

  def user_id_other_than_user_friend_id
    if user_id == user_friend_id
      errors.add(:user_friend_id, 'cannot same user id')
    end
  end
end