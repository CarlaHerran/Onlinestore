require 'pp'
class Controller 
  def initialize(args)
    @view = View.new
     welcome
  end

  def welcome
    option = @view.welcome
    depts_list = Dept.all
    user = case option
      when 1 then login(depts_list)
      when 2 then create_account
      when 3 then administrators
      when 4 then sellers
      when 5 then goodbye
      else
        welcome
    end  
  end


  def login(depts_list)
    data = @view.login
    @user = User.find_by_email_and_password(data[:email], data[:password])
    if @user
      puts "Haz iniciado sesión correctamente"
      show_products(depts_list)
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
      show_products(product_list) 
    end
  end

  def administrators
    data = @view.login
    @user = User.find_by_email_and_password(data[:email], data[:password]) 
    product_list = Product.all
    if @user && @user.admin
      select = @view.administrators
      case select
      when 1 then create_products
      when 2 then delete_products(product_list)
      when 3 then update_products(product_list)
      when 4 then goodbye
      else
        administrators
      end
    else
      puts "-------- Lo sentimos, No tienes una cuenta de administrador --------"
      welcome
    end
  end




def create_products
  data = @view.create_products
  if data[:name] == "" || data[:price] == "" || data[:quant] == "" || data[:dept] == 0
    "No puedes crear productos vacíos"
    administrators
  else
    product = Product.new(name: data[:name], price: data[:price].to_i, quant: data[:quant].to_i, dept: Dept.find(data[:dept] - 1 ) )
    if product.save
      puts "Producto #{product.name} creado exitosamente"
      welcome
    else 
      puts "Hubo algún error al crear tu producto, inténtalo de nuevo"
      create_products
    end
  end
end


def delete_products(product_list)
  delete = @view.delete_products(product_list)
  product = product_list[delete -1]
  puts "Este producto se borrará para siempre"
  product.destroy
  welcome
end


def update_products(product_list)
  update = @view.update_products(product_list)
  product = product_list[update -1]
  data = @view.updating(product)
  if data[:name] == "" || data[:price] == 0 || data[:quant] == 0
    "No puedes actualizar productos vacíos"
    welcome
  else
    product.update(name: data[:name], price: data[:price], quant: data[:quant])  
    puts "El producto #{product.name} se actualizó correctamente"
    welcome
  end
end



  def sellers
    data = @view.login
    @user = User.find_by_email_and_password(data[:email], data[:password]) 
    if @user && @user.seller
      select = @view.sellers
      if select == 1 
        update_products(Product.all)
      else
        welcome
      end
    else
      puts "No tienes una cuenta de vendedor"
      welcome
      end
  end



  def goodbye
    @view.goodbye
  end



  def show_products(depts_list)
    # @view.products(product_list)
    var = @view.depts(depts_list) 
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
    elect = @view.choosing(product_list)
    elect.each {|product_id| add_to_shopping_car(product_list[product_id]) }
    user_products = @view.shopping_car(@user)
    checkout = @view.checkout(user_products)
    if checkout
      finish_order
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
    sc = ShoppingCar.new(product_id: product.id, user_id: @user.id)
    if sc.save
      puts "Producto guardado"
    else
      puts "ERROR"
    end
  end

def finish_order
  shoppin_cars = @user.shopping_cars.all
  shoppin_cars.each do |sc|
    product = sc.product

    temp = product.decrement(:quant)
    if temp.quant >= 0
      temp.save
      sc.destroy
    else
      sc.destroy
      puts "No hay producto #{product.name}"
    end
  end
end


end       


