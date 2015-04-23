class Writer < ActiveRecord::Base
  has_secure_password
  has_many :comments 
  has_many :articles
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4}, on: :create
  validates :password, confirmation: true
         
 




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