class CreateLoanLists < ActiveRecord::Migration
  def change
    create_table :loan_lists do |t|
      t.string :platform_name
      t.string :url
      t.integer :caree
      t.string :desc
      t.string :tags
      t.string :success_rate
      t.string :success_rate_display
      t.string :tag_icon
      t.integer :apply_count
      t.integer :platform_type
      t.string :interest
      t.integer :sort_order
      t.string :amount_display
      t.string :interest_display
      t.string :term
      t.string :icon
      t.string :amount
      t.integer :is_hot
      t.string :loan_type
      t.integer :state, default: 0
      t.timestamps null: false
    end
  end
end
