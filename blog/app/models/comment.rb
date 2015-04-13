class Comment < ActiveRecord::Base
  belongs_to :article
#   add_foreign_key :article
end
