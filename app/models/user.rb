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

require 'open-uri' # So we can download the users photo and have paperclip resize them. 

class User < ActiveRecord::Base
  #Every shift can have a user associated with it. Users can have multiple shifts
  has_many :shifts
  has_many :time_workeds

  attr_accessible :username, :email, :name, :phone, :boxNum, :pCard, :rank, :password, :password_confirmation, :year, :photo_url, :photo
  attr_accessor :updating_password

  has_secure_password

  has_attached_file :photo , styles: { small: "150x150>" , thumb: "32x32>", medium: "290x290>" }

  before_create :download_remote_image

  before_save { |user| user.username = username.downcase }
  before_save { |user| user.rank = rank.upcase }
  before_save :create_remember_token
  before_validation :prep_email


  VALID_USERNAME_REGEX = /\A[a-z]{6}([a-z]|\d){2}\z/i
  VALID_PHONE_REGEX = /\(?\d{3}\)?[ -.]?\d{3}[ -.]?\d{4}/
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  VALID_RANK_REGEX = /\A[T][C][T|C]?\z/i


  validates :username, presence: true,
    length:     { maximum: 8 },
    format:     { with: VALID_USERNAME_REGEX },
    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
  validates :rank, presence: true,  format: { with: VALID_RANK_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, :if => :should_validate_password?
  validates :password_confirmation, presence: true, :if => :should_validate_password?
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone, allow_blank: true, format: {with: VALID_PHONE_REGEX}


  def get_user_shifts
    Shift.find(:all, :conditions => {:user_id => self.id})
  end

  def get_future_user_shifts
    get_user_shifts.keep_if {|x| x.starttime > Time.now - (60 * 15)}
  end

  def get_next_week_user_shifts
    get_future_user_shifts.keep_if{|x| x.starttime < Time.now + (60 * 60 *  24 * 7)}
  end

  def current_time_worked
    @time_worked ||= self.time_workeds.where(:endtime => nil).first
  end

  def clocked_in?
    # determine if the user is clocked
    current_time_worked != nil
  end

  def clock_in
    return TimeWorked.new(:user_id => self.id, :starttime => Time.now )
  end

  def clock_out
    current_time_worked.endtime = Time.now
  end


  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def prep_email
    self.email = self.username + '@grinnell.edu'
  end

  def should_validate_password?
    updating_password || new_record?
  end

  def download_remote_image
    io = open(URI.parse(photo_url))
    # def io.original_filename; base_uri.path.split('/').last; end
    self.photo = io
    rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc... 
  end



end
