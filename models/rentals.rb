require_relative('../db/sql_runner')

class Rental

  attr_reader :customer_id, :vehicle_id, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @vehicle_id = options['vehicle_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (
      customer_id,
      vehicle_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @vehicle_id]
    hash = SqlRunner.run(sql, values)
    @id = hash.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    hash = SqlRunner.run(sql)
    return hash.map {|rental| Rental.new(rental)}
  end

  def vehicle()
    sql = "SELECT * FROM vehicles WHERE id = $1"
    values = [@vehicle_id]
    hash = SqlRunner.run( sql, values )
    return Vehicle.new( hash.first )
  end

  def customer()
    sql = "SELECT * FROM ccustomers WHERE id = $1"
    values =[@customer_id]
    hash = SqlRunner.run(sql, values)
    return Customer.new(hash.first)
  end

  def self.find(id)
    sql = "SELECT * FROM ccustomers WHERE id = $1"
    values = [id]
    hash = SqlRunner.run(sql, values)[0]
    results = Rental.new(hash)
    return results
  end


 end
