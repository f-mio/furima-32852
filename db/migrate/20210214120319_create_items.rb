class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                  null: false, default: ""
      t.references :user,                  null: false, foreign_key: true
      t.integer    :price,                 null: false
      t.integer    :category_id,           null: false
      t.text       :explanation,           null: false
      t.integer    :state_id,              null: false
      t.integer    :shipping_fee_id,       null: false
      t.integer    :prefecture_id,         null: false
      t.integer    :scheduled_delivery_id, null: false
      t.timestamps
    end
  end
end
