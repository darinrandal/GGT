class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type, :default => 0
      t.integer :user_id1, :default => 0
      t.integer :user_id2, :default => 0
      t.integer :post_id, :default => 0

      t.timestamps
    end
  end
end