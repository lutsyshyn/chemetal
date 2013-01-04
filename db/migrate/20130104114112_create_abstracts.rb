class CreateAbstracts < ActiveRecord::Migration
  def change
    create_table :abstracts do |t|
      t.text :content
      t.text :keywords
      t.integer :article_id

      t.timestamps
    end
  end
end
