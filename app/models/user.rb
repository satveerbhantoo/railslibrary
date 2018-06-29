class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_password
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_many :books
  has_many :comments

  attr_accessor :username

  def active_for_authentication? 
    super && is_active?
  end

  def name
    if first_name == nil
       return email
    else
      "#{first_name} #{last_name}"
    end
  end

end
