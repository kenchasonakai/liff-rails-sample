class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :user_id
      t.string :grnv_bar_info_id
      t.string :memo
      t.date :drank_on

      t.timestamps
    end
  end
end
