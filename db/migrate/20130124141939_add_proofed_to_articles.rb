class AddProofedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :proofed, :boolean
  end
end
