class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'Profile'
  belongs_to :followee, foreign_key: 'followee_id', class_name: 'Profile'

  def get_profile_by_followee(user_id)
    Profile.find(user_id)
  end
end
