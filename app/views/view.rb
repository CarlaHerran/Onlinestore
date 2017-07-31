class View
	# Recuerda que la única responsabilidad de la vista es desplegar data al usuario
  # Los siguientes métodos son sólo un ejemplo:
  def welcome
  puts "1.- Login and Start Shopping!"
  puts "2.- Create account"
  puts "3.- Administrators"
  puts "4.- Sellers"
  puts "5.- EXIT"
  gets.to_i
  end

  def login
    puts "Enter your email:"
    email = gets.chomp
    puts "Enter your password:"
    password = gets.chomp
    {email: email, password: password}

  end

  def create_account
    puts "Choose a user name:"
    name = gets.chomp
    puts "Add an email:"
    email = gets.chomp
    puts "Choose a password:"
    password = gets.chomp
    {name: name, email: email, password: password}
  end

  def depts
    puts "*****************************START SHOPPING!**************************************"
    puts "Shop Departments:"
    puts "1.- Fruits"
    puts "2.- Flowers"
    puts "3.- Instruments"
    puts "4.- Home"
    seleccion = gets.chomp.to_i
    case seleccion
      when 1 then p "Welcome to the Fruits Department!" 
      when 2 then p "Welcome to the Flowers Department!"
      when 3 then p "Welcome to the Instruments Department!"
      when 4 then p "Welcome to the Home Department!"
    end
    seleccion
  end

  def products(product_list)
    puts "Products:"
    # gets.to_i
    # product_list = [Product.where(dept_id: 1).all]
    product_list.each_with_index do |pro, index|
      puts "-"*40
      puts "#{ index + 1 } .- #{pro.name.upcase}                      $#{pro.price}"
      puts "-"*40
    end
    # choosing
  end


def choosing
  choosed_products = []
  continue = true
  while continue 
    puts "Escoge un producto o presiona enter para regresar al menu anterior:"
    elect = gets.chomp
    if elect.to_i != 0
      choosed_products << elect.to_i - 1 
      continue = true
    else
      continue = false
    end
  end
  choosed_products
end

def shopping_car(user)
  puts "****************** SHOPPING CAR *********************"
  p user.shopping_cars
  user.shopping_cars.all.map do |sc|
    product = Product.find(sc.product.id)
    puts "#{product.name.center(10)} -> #{product.price.to_s.center(10)}"
    product
  end
end

def checkout(user_products)
  sum = user_products.pluck(:price).inject(&:+)
  puts "¿Deseas realizar esta compra? Y/N"
  puts "TOTAL COST: #{sum}"
  gets.chomp == "Y"
end


  def administrators
    puts "Administrators Menu"
    puts "1.- Create Product"
    puts "2.- Delete product"
    puts "3.- Update product"
    gets.to_i
  end
  
  def sellers
    puts "Sellers Menu"
    puts "1.- Update products"
    puts "2.- Exit"
    gets.to_i
  end
  
  def goodbye
    puts "Than You for Shopping with Us!"
  end
  

end


	# def index
	# end

 #  def create
 #  end

 #  def delete
 #  end

 #  def update
 #  end

	# def error
	# end
