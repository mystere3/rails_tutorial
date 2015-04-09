class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, index: true

      t.timestamps
    end
    # add_foreign_key :comments, :articles  # MIGRATE HAS A HARD TIME WITH THIS. THINK ITS FOR RAILS 4.2.0 and up only.
  end
end
