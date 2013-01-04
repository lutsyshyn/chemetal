class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :journal_id
      t.text :title
      t.string :pages
      t.integer :code
      t.string :supplementary_materials
      t.string :supporting_information

      t.timestamps
    end
  end
end
