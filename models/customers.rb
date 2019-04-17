require_relative( '../db/sql_runner' )


class Customer

  attr_reader :first_name, :last_name, :country, :city, :age
  attr_accessor :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @country = options['country']
    @city  = options['city']
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO ccustomers
    (
      first_name,
      last_name,
      country,
      city,
      age
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@first_name, @last_name, @country, @city, @age]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM ccustomers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM  ccustomers WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM ccustomers"
    results = SqlRunner.run(sql)
    return results.map{|customer| Customer.new(customer)}
  end

  def self.find(id)
    sql = "SELECT * FROM ccustomers WHERE id = $1"
    values = [id]
    hash = SqlRunner.run(sql, values)[0]
    results = Customer.new(hash)
    return results
  end

  def vehicles()
    sql = "SELECT v.* FROM vehicles v INNER JOIN
    rentals r ON r.vehicle_id = v.id
    WHERE r.customer_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |vehicle| Vehicle.new(vehicle) }
  end

end
