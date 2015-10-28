class CreateCalorieCounts < ActiveRecord::Migration
  def change
    create_table :calorie_counts do |t|
      t.integer :count

      t.references :countable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
