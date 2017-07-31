require 'pp'
class Controller 
  def initialize(args)
    @view = View.new
     welcome
  end

  def welcome
    option = @view.welcome
    user = case option
      when 1 then login
      when 2 then create_account
      when 3 then administrators
      when 4 then sellers
      when 5 then goodbye
      else
        welcome
    end  
  end


  def login
    data = @view.login
    @user = User.find_by_email_and_password(data[:email], data[:password])
    if @user
      puts "Haz iniciado sesión correctamente"
      show_products
    else
      puts "No se encontró el usuario. Inténtalo nuevamente."
      welcome
    end
  end


  def create_account
    data = @view.create_account
    @user = User.find_by(email: data[:email])
    if @user
      puts "El correo ya existe, inténtalo nuevamente"
      welcome
      
    else
      @user = User.create(name: data[:name], email: data[:email], password: data[:password])
      puts "Haz creado tu cuenta exitosamente!"
      show_products 
    end
  end

  def administrators
    @view.administrators
  end


  def sellers
    @view.sellers
  end


  def goodbye
    @view.goodbye
  end



  def show_products
    # @view.products(product_list)
    var = @view.depts 
    dept = Dept.find_by(id: var.to_i)
    # product = Product.find_by(dept_id: var.to_i)
    product_list = Product.where(dept_id: dept).all
    if product_list.empty?
      p "No se encuentra ese departamento, elige una de las opciones de arriba."
    else
      @view.products(product_list).index
      choose(product_list)  
    end

      # if var == 1 
      #   product_list = Product.where(dept_id: 1).all
      #     @view.products(product_list).index
      # elsif var == 2
      #     product_list = Product.where(dept_id: 2).all
      #     @view.products(product_list).index
      # elsif var == 3
      #    product_list = Product.where(dept_id: 3).all
      #     @view.products(product_list).index
      # elsif var == 4
      #     product_list = Product.where(dept_id: 4).all
      #     @view.products(product_list).index
      # else
      #   p "No se encuentra ese departamente, elige una de las opciones de arriba."
      # end
  end


  def choose(product_list)
    elect = @view.choosing
    elect.each {|product_id| add_to_shopping_car(product_list[product_id]) }
    p @user
    p @user.shopping_cars
    user_products = @view.shopping_car(@user)
    checkout = @view.checkout(user_products)
    if checkout
      puts "Muchas gracias por tu compra! :D "
    else
      show_products
    end
  end


def shop(user_products)
  user_products.each do |prod|
    prod.decrement(:quant)
    if prod.quant <= 0
      puts "Lo sentimos, no hay suficientes #{prod.name}"
    end
  end

end








  def add_to_shopping_car(product)
    sc = ShoppingCar.new(product_id: product.id, user_id: @user.id) # CAMBIAR USUARIO
    p sc
    if sc.save
      p sc 
      puts "Producto guardado"
    else
      puts "ERROR"
    end
  end




end       


