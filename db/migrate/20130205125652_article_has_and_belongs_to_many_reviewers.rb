class ArticleHABTMReviewers < ActiveRecord::Migration
  def up
    create_table :reviews_reviewers, :id => false do |t|
      t.references :user, :article
    end
  end

  def self.down
    drop_table :reviews_reviewers
  end
end
