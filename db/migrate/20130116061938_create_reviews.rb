class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :article
      t.string :title_issues

      t.timestamps
    end
  end
end
