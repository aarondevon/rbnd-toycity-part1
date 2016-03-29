require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  products_hash["items"].each do |toy|
    puts toy["title"]
    puts "********************"

    # Print the retail price of the toy
    retail_price = toy["full-price"].to_f
    puts "Retail Price: $#{retail_price}"

    # Calculate and print the total number of purchases
    purchases_counter = 0

    toy["purchases"].each do |purchases|
      purchases_counter =  purchases_counter + 1
    end

    puts "Total Purchases: #{purchases_counter}"

    # Calculate and print the total amount of sales
    total_sales = 0

    toy["purchases"].each do |sale_price|

    total_sales = total_sales + sale_price["price"]
    end

    puts "Total Sales: $#{total_sales}"

    # Calculate and print the average price the toy sold for
    puts "Average Price: #{total_sales / purchases_counter}"

    # Calculate and print the average discount (% or $) based off the average sales price
    average_discount = ((retail_price * purchases_counter) - total_sales) / purchases_counter

    puts "Average Discount: $#{average_discount}"

    avergae_discount_percent = average_discount / (retail_price / 100)
    avergae_discount_percent = avergae_discount_percent.round(2)
    puts "Average Discount Percentage: #{avergae_discount_percent}%"

    puts "********************"
    puts

  end

	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  products_hash["items"].each do |brand|
      current_brand = brand["brand"]
    puts "#{brand["brand"]} \n********************" if brand["stock"].to_i > 0

      # Count the number of the brand's toys we stock
      # Calculate the average price of the brand's toys
      stock = []
      price = []
      brand_sales = []
      total_brand_stock = 0
      average_brand_price = 0
      total_brand_sales = 0
      products_hash["items"].each do |same|
        if current_brand == same["brand"] #&& same["stock"].to_i > 0
          stock << same["stock"].to_i
          price << same["full-price"].to_f
          same["purchases"].each do |brand_price|
            brand_sales << brand_price["price"].to_f
          end
        end
      end
      # Print the number of the brand's toys we stock
      stock.each do |add|
        total_brand_stock += add
      end

      puts "Number of Products: #{total_brand_stock}" if brand["stock"].to_i > 0

      # Print the average price of the brand's toys
      price.each do |add|
        average_brand_price += add
      end

      # Try and think of different way of getting the number 2
      brands = []
      products_hash["items"].each do |brand_count|
        if current_brand == brand_count["brand"]
          brands << brand_count["brand"]
        end
      end
      brands_counter = brands.count(current_brand)



      average_brand_price = average_brand_price / brands_counter
      puts "Average Product Price: $#{average_brand_price.round(2)}" if brand["stock"].to_i > 0

     # Calculate and print the total revenue of all the brand's toy sales combined
     brand_sales.each do |add|
       total_brand_sales += add
     end
     puts "Total Sales: #{total_brand_sales.round(2)}" if brand["stock"].to_i > 0

     puts

  end
