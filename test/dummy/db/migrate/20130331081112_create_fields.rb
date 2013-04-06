class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :type_id
      t.string :alias
      t.boolean :active

      t.timestamps
    end
  end
end
