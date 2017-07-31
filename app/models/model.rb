class User < ActiveRecord::Base
  has_many :shopping_cars
  has_many :products, through: :shopping_cars
end


class ShoppingCar <ActiveRecord::Base
  belongs_to :user
  belongs_to :product
end


class Product < ActiveRecord::Base
  belongs_to :dept
  belongs_to :user
end


class Dept < ActiveRecord::Base
  has_many :products
end
