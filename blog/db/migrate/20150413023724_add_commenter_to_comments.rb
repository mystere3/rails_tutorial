class AddCommenterToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter, :string
    # I realized this column was too embedded in other code to work around. I wanted to have the writer log in to site and all articles and comments be tied to that but I'm not going to do that for this project. To much rewriting.
  end
end
