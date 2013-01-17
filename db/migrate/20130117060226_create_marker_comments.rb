class CreateMarkerComments < ActiveRecord::Migration
  def change
    create_table :marker_comments do |t|
      t.string :selection
      t.string :comment
      t.references :review

      t.timestamps
    end
    add_index :marker_comments, :review_id
  end
end
