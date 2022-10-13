require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|

  category = Category.find_or_create_by(
    name: product["category"]
  )

  # name,price,description,stock quantity,category

  if category && category.valid?
    category.product.create(
      title:          product["name"],
      description:    product["description"],
      price:          product["price"],
      stock_quantity: product["stock quantity"]
    )

  else
    puts "Category is invalid #{product["category"]}"

  end

end