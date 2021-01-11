class CreateGrnvBarInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :grnv_bar_infos do |t|
      t.string :grnv_id
      t.string :address
      t.string :name
      t.string :image
      t.string :grnv_url
      t.string :grnv_tel
      t.string :opentime
      t.string :holiday
      t.string :tel

      t.timestamps
    end
  end
end
