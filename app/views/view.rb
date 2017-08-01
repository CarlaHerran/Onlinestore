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


  def depts(depts_list)
    puts "*****************************START SHOPPING!**************************************"
    seleccion = depts_list
    case seleccion
      when 1 then p "Welcome to the Fruits Department!" 
      when 2 then p "Welcome to the Flowers Department!"
      when 3 then p "Welcome to the Instruments Department!"
      when 4 then p "Welcome to the Home Department!"
    else
      depts
    end
    seleccion
  end


def depts_list
  puts "Shop Departments:"
    puts "1.- Fruits"
    puts "2.- Flowers"
    puts "3.- Instruments"
    puts "4.- Home"
    seleccion = gets.chomp.to_i
end


  def products(product_list)
    puts "Products:"
    # gets.to_i
    # product_list = [Product.where(dept_id: 1).all]
    product_list.each_with_index do |pro, index|
      puts "-"*40
      puts "#{ index + 1 } .- #{pro.name.upcase}           #{pro.quant}                $#{pro.price}"
      puts "-"*40
    end
    # choosing
  end


def choosing(product_list)
  choosed_products = []
  continue = true
  while continue 
    puts "Escoge un producto o presiona enter para regresar al menu anterior:"
    elect = gets.chomp
    if elect.to_i != 0
      num_real = elect.to_i - 1
      prod = product_list[num_real]
      if prod.quant > 0
        choosed_products << num_real
      else
        puts "No hay #{prod.name} en existencia"
      end
      continue = true
    else
      continue = false
    end
  end
  choosed_products
end

def shopping_car(user)
  puts "****************** SHOPPING CAR *********************"
  user.shopping_cars.all.map do |sc|
    product = sc.product
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
    puts "4.- Exit"
    gets.to_i
  end
  
def create_products
  puts "------------ CREAR PRODUCTO -------------------"
  puts "Deja todos los campos en blanco para regresal al menu de administrador"
  puts "Nombre del producto:"
  name = gets.chomp
  puts "Precio del producto:"
  price = gets.chomp
  puts "Cantidad de producto:"
  quant = gets.chomp
  puts "Departamento al que pertenece el producto"
  dept = depts_list
  {name: name, price: price, quant: quant, dept: dept}
end

def delete_products(product_list)
  puts "---------- BORRAR PRODUCTO -------------"
  products(product_list)
  puts "Selecciona el producto que deseas borrar"
  delete = gets.to_i
end


def update_products(product_list)
  puts "---------- ACTUALIZAR PRODUCTO ------------"
  products(product_list)
  puts "selecciona el producto que quieres actualizar"
  update = gets.to_i
end
 
  def updating(product)
    puts "DEJA LOS CAMPOS EN BLANCO SI DESEAS SALIR"
    puts "Actualiza el nombre de #{product.name}"
    name = gets.chomp
    puts "Actualiza el precio de #{product.price}"
    price = gets.to_i
    puts "Actualiza la cantidad de #{product.quant}"
    quant = gets.to_i
    {name: name, price: price, quant: quant}
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
