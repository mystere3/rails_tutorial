class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :writer
  validates :title, presence: true, length: { minimum: 5}
#   add_foreign_key :writer
end
