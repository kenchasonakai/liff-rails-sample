class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :user_id
      t.string :grnv_id
      t.string :memo

      t.timestamps
    end
  end
end
