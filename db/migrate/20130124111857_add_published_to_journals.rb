class AddPublishedToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :published, :boolean, default: false
  end
end
