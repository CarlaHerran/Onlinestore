# Este archivo sirve para crear registros de prueba
user1 = User.create(name: 'Juan Perez', email: 'juan@gmail.com', admin: false, seller: false, password: 'hola')
user2 = User.create(name: 'Pablito Robles', email: 'pablito@gmail.com', admin: false, seller: false, password: 'hola')
user3 = User.create(name: 'Maria Benito', email: 'lamari@gmail.com', admin: false, seller: false, password: 'hola')
user4 = User.create(name: 'Carla', email: 'carla.herran@gmail.com', admin: true, seller: false, password: 'hola')
user5 = User.create(name: 'Carlis', email: 'c', admin: true, seller: true, password: 'c')


dept1 = Dept.create(name: 'Fruits')
dept2 = Dept.create(name: 'Flowers')
dept3 = Dept.create(name: 'Instruments')
dept4 = Dept.create(name: 'Home')


product1 = Product.create(dept_id: dept1.id, name: 'Manzana', price: 10, quant: 10)
product2 = Product.create(dept_id: dept1.id, name: 'Pera', price: 10, quant: 10)
product3 = Product.create(dept_id: dept1.id, name: 'Banana', price: 10, quant: 10)
product4 = Product.create(dept_id: dept1.id, name: 'Melon', price: 10, quant: 10)
product5 = Product.create(dept_id: dept1.id, name: 'Mango', price: 10, quant: 10)

product1 = Product.create(dept_id: dept2.id, name: 'Margarita', price: 10, quant: 10)
product2 = Product.create(dept_id: dept2.id, name: 'Girasol', price: 10, quant: 10)
product3 = Product.create(dept_id: dept2.id, name: 'Petunia', price: 10, quant: 10)
product4 = Product.create(dept_id: dept2.id, name: 'Gardenia', price: 10, quant: 10)
product5 = Product.create(dept_id: dept2.id, name: 'Tulipan', price: 10, quant: 10)

product1 = Product.create(dept_id: dept3.id, name: 'Guitarra', price: 10, quant: 10)
product2 = Product.create(dept_id: dept3.id, name: 'Bajo', price: 10, quant: 10)
product3 = Product.create(dept_id: dept3.id, name: 'Violín', price: 10, quant: 10)
product4 = Product.create(dept_id: dept3.id, name: 'Saxofón', price: 10, quant: 10)
product5 = Product.create(dept_id: dept3.id, name: 'Piano', price: 10, quant: 10)

product1 = Product.create(dept_id: dept4.id, name: 'Silla', price: 10, quant: 10)
product2 = Product.create(dept_id: dept4.id, name: 'Mesa', price: 10, quant: 10)
product3 = Product.create(dept_id: dept4.id, name: 'Florero', price: 10, quant: 10)
product4 = Product.create(dept_id: dept4.id, name: 'Sillón', price: 10, quant: 10)
product5 = Product.create(dept_id: dept4.id, name: 'Reloj', price: 10, quant: 10)









