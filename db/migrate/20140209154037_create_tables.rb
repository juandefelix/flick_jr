class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.timestamps
    end

    create_table :albums do |t|
      t.integer :user_id
      t.string :name
      t.timestamps
    end

    create_table :photos do |t|
      t.integer :album_id
      t.string :name
      t.timestamps
    end
  end
end
