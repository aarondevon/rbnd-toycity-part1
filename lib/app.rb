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
    puts "Retail Price: $#{toy["full-price"]}"
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
    puts

  end




  # Calculate and print the average discount (% or $) based off the average sales price


	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
