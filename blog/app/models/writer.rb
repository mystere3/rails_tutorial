class Writer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :comments 
  has_many :articles
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4}, on: :create
  validates :password_confirmation, presence: true
         
 




  # This only validates username for now
  
#   def self.validate(name, pass)
# #     binding.pry
#     user = Writer.find_by name: name

#     if user != nil
#       @current_user_id = user.id
#       return user
#     else
#       @current_user_id = nil
#       return nil
#     end
#   end




end