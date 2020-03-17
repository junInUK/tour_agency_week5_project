require_relative("../db/sql_runner.rb")

class Tourist

  attr_reader :id
  attr_accessor :name, :email, :phone_number, :address, :funds

  def initialize(tourist)
    @id           = tourist['id'].to_i if tourist['id']
    @name         = tourist['name']
    @email        = tourist['email']
    @phone_number = tourist['phone_number']
    @address      = tourist['address']
    @funds        = tourist['funds'].to_i
  end

  def save()
    sql = "INSERT INTO tourists(name,email,phone_number,address,funds)
        VALUES($1,$2,$3,$4,$5) RETURNING id"
    values = [@name,@email,@phone_number,@address,@funds]
    tourist = SqlRunner.run(sql,values).first
    @id = tourist['id'].to_i
    return @id
  end

  def self.delete_all()
    sql = "DELETE FROM tourists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM tourists"
    results = SqlRunner.run(sql)
    tourists = results.map{|tourist| Tourist.new(tourist)}
    return tourists
  end

  def self.get_by_tour(id)
    sql = "SELECT tourists.* FROM tourists
          inner join bookings on tourists.id = bookings.tourist_id
          where bookings.tour_id = $1"
    value = [id]
    results = SqlRunner.run(sql,value)
    tourists = results.map{|tourist| Tourist.new(tourist)}
    return tourists
  end

end
