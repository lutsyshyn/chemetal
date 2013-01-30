class AddLockedAndVisibleToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :locked, :boolean, default: false
    add_column :articles, :visible, :boolean, default: true
  end
end
