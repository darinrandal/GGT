class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.integer :postcount, :default => 0
      t.boolean :admin, :default => false
      t.boolean :banned, :default => false

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
