class Profile < ApplicationRecord
  belongs_to :user

  has_many :follower_relationships, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followee_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followee, through: :followee_relationships, source: :followee

  mount_uploader :avatar, AvatarUploader
  serialize :avatar, JSON # If you use SQLite, add this line.


  def follow(user_id)
    followee_relationships.create(followee_id: user_id)
  end

  def unfollow(user_id)
    followee_relationships.find_by(followee_id: user_id).destroy
  end
  # Returns true if the current user is followee the other user.
  def followee?(other_user)
    followee_relationships.include?(other_user)
  end
end
