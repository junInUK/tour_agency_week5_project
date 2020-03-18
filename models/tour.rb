require_relative('vehicle.rb')
require_relative('../db/sql_runner.rb')

class Tour

  attr_reader :id
  attr_accessor :name, :start_date, :days, :price, :pic_url, :vehicle_id

  def initialize(tour)
    @id         = tour['id'].to_i if tour['id']
    @name       = tour['name']
    @start_date = tour['start_date']
    @days       = tour['days'].to_i
    @price      = tour['price'].to_i
    @pic_url    = tour['pic_url']
    @vehicle_id = tour['vehicle_id'].to_i
  end

  def save()
    # binding.pry
    sql = "INSERT INTO tours(name,start_date,days,price,pic_url,vehicle_id)
          VALUES($1,$2,$3,$4,$5,$6) RETURNING id"
    values = [@name,@start_date,@days,@price,@pic_url,@vehicle_id]
    tour_hash = SqlRunner.run(sql,values).first
    @id = tour_hash['id'].to_i
    return @id
  end

  def get_vehicle_by_id()
    sql = "SELECT * FROM vehicles where id = $1"
    value = [@vehicle_id]
    vehicle_hash = SqlRunner.run(sql,value).first
    vehicle = Vehicle.new(vehicle_hash)
    return vehicle
  end

  def self.all()
    sql = "SELECT * FROM tours"
    results = SqlRunner.run(sql)
    tours = results.map{|tour| Tour.new(tour)}
    return tours
  end

  def self.delete_all()
    sql = "DELETE FROM tours"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM tours WHERE id = $1"
    value = [id]
    SqlRunner.run(sql,value)
  end

  def self.find(id)
    sql = "SELECT * FROM tours where id = $1"
    value = [id]
    result = SqlRunner.run(sql,value).first
    tour = Tour.new(result)
    return tour
  end

  def update()
    sql = "UPDATE tours set (name,start_date,days,price,pic_url,vehicle_id)
    = ($1,$2,$3,$4,$5,$6) WHERE id = $7"
    values = [@name,@start_date,@days,@price,@pic_url,@vehicle,@id]
    SqlRunner.run(sql,values)

  end

  def self.get_by_tourist(id)
    sql = "SELECT tours.* FROM tours inner join bookings
    on tours.id = bookings.tour_id
    where bookings.tourist_id = $1"
    value = [id]
    results = SqlRunner.run(sql,value)
    tours = results.map{|tour| Tour.new(tour)}
    return tours
  end

end
