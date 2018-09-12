require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'billboard.csv'))
csv_rows = CSV.parse(csv_text)

csv_rows.each do |row|
  next if row == csv_rows.first

  billboard_name = row.first
  image_url      = row.last

  next if Billboard.find_by_name(billboard_name).present?

  Billboard.create(name: billboard_name, image_url: image_url)
end

