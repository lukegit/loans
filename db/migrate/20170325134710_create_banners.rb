class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :img
      t.string :msg
      t.string :url
      t.integer :banner_type
      t.integer :state, default: 0
      t.timestamps null: false
    end
  end
end
