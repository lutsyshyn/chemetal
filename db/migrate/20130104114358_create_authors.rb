class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :initials
      t.string :email
      t.integer :article_id

      t.timestamps
    end
  end
end
