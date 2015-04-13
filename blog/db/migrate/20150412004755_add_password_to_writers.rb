class AddPasswordToWriters < ActiveRecord::Migration
  def change
    add_column :writers, :password, :string
  end
end
