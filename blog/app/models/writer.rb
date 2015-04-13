class Writer < ActiveRecord::Base
  has_many :comments, :articles
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4}
            
#   add_foreign_key :comments, :articles
end