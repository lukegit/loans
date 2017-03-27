class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :profession
      t.integer :money_amount
      t.integer :time_limit
      t.integer :use
      t.string :name
      t.string :work_location
      t.string :income
      t.integer :has_card
      t.string :phone
      t.integer :state
      t.string :reason
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
