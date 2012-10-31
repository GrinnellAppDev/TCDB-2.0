# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :name, :phone, :boxNum, :pCard, :rank, :password, :password_confirmation
  has_secure_password
  before_save { |user| user.username = username.downcase }
  before_save :create_remember_token 
  before_save :prep_email

  validates :username, presence: true, length: { maximum: 10 },
                   uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
  validates :rank, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    def prep_email
      self.email = self.username + '@grinnell.edu'
    end
end
