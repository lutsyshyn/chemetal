class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :article_id
      t.string :file
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
