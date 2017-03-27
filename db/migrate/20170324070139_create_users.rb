class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :telephone
      t.string :password_digest
      t.integer :state
      t.timestamps null: false
    end
  end
end
