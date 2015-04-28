class RemovePasswordDigestFromWriters < ActiveRecord::Migration
  def change
    remove_column :writers, :password_digest
  end
end
