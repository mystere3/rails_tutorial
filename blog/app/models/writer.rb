class Writer < ActiveRecord::Base
  has_many :comments 
  has_many :articles
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4}
            
end