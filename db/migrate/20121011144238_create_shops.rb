class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |u|
      u.string :name
      u.string :email
      u.boolean :admin
      u.boolean :seller
      u.string :password
    end

    create_table :depts do |d|
      d.string :name
    end

    create_table :products do |p|
      p.belongs_to :dept
      p.belongs_to :shopping_car
      p.string :name
      p.integer :quant
      p.integer :price
    end

    create_table :shopping_cars do |c|
      c.belongs_to :user, index: true
      c.belongs_to :product, index: true
      # c.integer :total_cost
    end 

  end
end
