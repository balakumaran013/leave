class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :first_name,:last_name,:mobile_no,:email,:password,:password_confirmation, presence: true

  has_many :leavelog
  
end
