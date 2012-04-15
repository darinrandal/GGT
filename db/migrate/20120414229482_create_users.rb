class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end

    add_column :users, :admin, :boolean, default: false
    add_column :users, :banned, :boolean, default: false

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
