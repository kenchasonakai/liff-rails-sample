class CreateMunis < ActiveRecord::Migration[6.0]
  def change
    create_table :munis do |t|
      t.string :prefecture_no
      t.string :prefecture_name
      t.string :muni_cd
      t.string :muni_name

    end
  end
end
