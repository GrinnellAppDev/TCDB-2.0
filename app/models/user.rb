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
  before_save { |user| user.rank = rank.upcase }
  before_save :create_remember_token 
  before_validation :prep_email
  VALID_USERNAME_REGEX = /\A[a-z]{6}([a-z]|\d){2}\z/i
  validates :username, presence: true,
                       length:     { maximum: 8 },
                       format:     { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_RANK_REGEX = /\A[T][C][T|C]?\z/i
  validates :rank, presence: true,  format: { with: VALID_RANK_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence: true

    def get_user_shifts
      Shift.find(:all, :conditions => {:userid => self.id})
    end

    def get_future_user_shifts
      get_user_shifts.keep_if {|x| x.starttime > Time.now - (60 * 15)}
    end

    def get_next_week_user_shifts
      get_future_user_shifts.keep_if{|x| x.starttime < Time.now + (60 * 60 *  24 * 7)}
    end


  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    def prep_email
      self.email = self.username + '@grinnell.edu'
    end

end
