class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_many :books

  def active_for_authentication? 
    super && is_active?
  end
end
