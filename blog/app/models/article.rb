class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :writer, :class_name => 'Writer', :foreign_key => 'writer_id'
  validates :title, presence: true, length: { minimum: 5}
#   add_foreign_key :writer
end
