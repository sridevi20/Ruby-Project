require_relative('../db/sql_runner')

class Vehicle
  attr_reader :make, :model, :colour,  :seat_capacity, :fuel_type, :daily_price, :available_stock
  attr_accessor :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @make = options['make']
    @model = options['model']
    @colour = options['colour']
    @seat_capacity = options['seat_capacity']
    @fuel_type  = options['fuel_type']
    @daily_price = options['daily_price']
    @available_stock = options['available_stock'].to_i
  end


  def save()
    sql = "INSERT INTO vehicles
    (
      make,
      model,
      colour,
      seat_capacity,
      fuel_type,
      daily_price,
      available_stock

    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6,$7
    )
    RETURNING id"
    values = [@make, @model, @colour, @seat_capacity, @fuel_type,  @daily_price, @available_stock ]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
  def update()
    sql = "UPDATE vehicles
    SET
    (
      make,
      model,
      colour,
      seat_capacity,
      fuel_type,
      daily_price,
      available_stock
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7
      )
      WHERE id = $8"
      values = [@make, @model, @colour, @seat_capacity, @fuel_type,  @daily_price, @available_stock , @id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM vehicles"
      SqlRunner.run(sql)
    end

    def delete()
      sql = "DELETE FROM vehicles WHERE id = $1"
      values=[@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM vehicles"
      results = SqlRunner.run(sql)
      return results.map {|vehicle| Vehicle.new(vehicle)}
    end

    def self.find(id)
      sql = "SELECT * FROM vehicles WHERE id = $1"
      values = [id]
      hash = SqlRunner.run(sql, values)[0]
      results = Vehicle.new(hash)
      return results
    end

    def customers()
      sql = "SELECT c.*  FROM ccustomers c
      INNER JOIN rentals r ON r.customer_id = c.id
      WHERE r.vehicle_id = $1"
      values = [@id]
      result = SqlRunner.run(sql, values)
      return result.map {|customer| Customer.new(customer)}
    end

    def availability
      return @available_stock > 0
    end

end
