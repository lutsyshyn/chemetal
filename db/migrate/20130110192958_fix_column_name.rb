class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :attachments, :type, :extension
  end

  def down
  end
end
