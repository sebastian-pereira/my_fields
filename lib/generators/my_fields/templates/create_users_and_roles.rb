class CreateUsersAndRoles < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name, :limit => 50, :null => false
      t.string :surname, :limit => 50, :null => false
      t.string :email, :null => false
      t.string :password, :limit => 32, :null => false
      t.string :user_hash, :limit => 32, :null => false
      t.string :avatar
      t.integer :user_role_id
      t.boolean :active, :default => 1
      t.boolean :trash, :default => 0

      t.timestamps
    end
    
    create_table :user_roles do |t|
      t.string :name, :limit => 50
      t.string :alias, :limit => 20
      t.boolean :active, :default => 1

      t.timestamps
    end
    add_index :user_roles, :alias, :unique => true
    
    add_index :users, :email, :unique => true
    execute "ALTER TABLE users ADD CONSTRAINT fk_role FOREIGN KEY (user_role_id) REFERENCES user_roles(id) ON DELETE RESTRICT ON UPDATE RESTRICT"
  end
  
  def down
    
    remove_index :users, :email
    remove_index :user_roles, :alias
    
    drop_table :users
    drop_table :user_roles
    
  end
end
