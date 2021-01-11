require "csv"

CSV.foreach('db/muni.csv', headers: true) do |row|
  Muni.create(
    prefecture_no: row['prefecture_no'],
    prefecture_name: row['prefecture_name'],
    muni_cd: row['muni_cd'],
    muni_name: row['muni_name']
  )
end
