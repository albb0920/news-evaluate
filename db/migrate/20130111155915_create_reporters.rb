class CreateReporters < ActiveRecord::Migration
  def change
    create_table :reporters do |t|
      t.string :name
      t.references :company

      t.timestamps
    end
    add_index :reporters, :company_id
  end
end
