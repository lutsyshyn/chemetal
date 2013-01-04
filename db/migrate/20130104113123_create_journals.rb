class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :volume
      t.string :issue
      t.string :pages
      t.integer :year

      t.timestamps
    end
  end
end
