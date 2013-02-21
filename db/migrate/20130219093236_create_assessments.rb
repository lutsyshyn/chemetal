class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :novelty
      t.string :importance
      t.string :title
      t.string :abstract
      t.string :keywords
      t.string :credit
      t.string :clarity
      t.string :arguments
      t.string :reference
      t.string :tables
      t.string :illustrations
      t.string :language
      t.string :summary
      t.text :body

      t.timestamps
    end
  end
end
