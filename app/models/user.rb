class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    username = conditions.delete(:username)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: username.strip.downcase}]).first
  end

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :news

  has_many :gazooy

  after_create :create_profile

  def create_profile
    profile = Profile.new(user: self)
    profile.save!
  end
end