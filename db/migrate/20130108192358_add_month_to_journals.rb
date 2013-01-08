class AddMonthToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :month, :string
  end
end
