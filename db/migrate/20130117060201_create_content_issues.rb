class CreateContentIssues < ActiveRecord::Migration
  def change
    create_table :content_issues do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
