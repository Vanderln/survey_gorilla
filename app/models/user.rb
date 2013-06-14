class User < ActiveRecord::Base
  has_many :respondents
  has_many :surveys, :through => :respondents
  has_many :responses
  has_many :choices, :through => :responses


  include BCrypt
 

  validates_uniqueness_of :username, :message => "You're already signed up."
  validates :username, :presence => true
  validates_presence_of :password, :message => "You need a password."
  validates :password, :length => { :minimum => 2 }


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    if new_password.length > 0
      @password = Password.create(new_password)
      self.password_hash = @password
    else
      @password = ''
    end
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      user
    else
      false
    end
  end 
end
