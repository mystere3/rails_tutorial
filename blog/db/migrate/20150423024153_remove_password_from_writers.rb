class RemovePasswordFromWriters < ActiveRecord::Migration
  def change
    remove_column :writers, :password, :string
  end
end
