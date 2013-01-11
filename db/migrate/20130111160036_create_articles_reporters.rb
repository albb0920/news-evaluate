class CreateArticlesReporters < ActiveRecord::Migration
  def change
    create_table :articles_reporters, id: false do |t|
      t.integer :article_id
      t.integer :reporter_id
    end
    add_index :articles_reporters, [:article_id, :reporter_id]
    add_index :articles_reporters, [:reporter_id, :article_id]
  end
end
