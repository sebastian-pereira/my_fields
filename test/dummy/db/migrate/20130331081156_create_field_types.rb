class CreateFieldTypes < ActiveRecord::Migration
  def change
    create_table :field_types do |t|
      t.string :name
      t.string :alias
      t.boolean :active

      t.timestamps
    end
  end
end
