require_relative("../db/sql_runner.rb")
class Booking

  attr_reader :id
  attr_accessor :tour_id, :tourist_id, :booking_date

  def initialize(booking)
    @id           = booking['id'].to_i if booking['id']
    @tour_id      = booking['tour_id'].to_i
    @tourist_id   = booking['tourist_id'].to_i
    @booking_date = booking['booking_date']
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    bookings = results.map{|booking| Booking.new(booking)}
    return bookings
  end

  def self.destroy(id)
    sql = "DELETE FROM bookings where id = $1"
    value = [id]
    SqlRunner.run(sql,value)
  end

  def save()
    sql = "SELECT Booking($1,$2,$3);"
    values = [@tourist_id,@tour_id,@booking_date]
    booking = SqlRunner.run(sql,values).first
    @id = booking['id'].to_i
    return @id

    #
    # sql = "INSERT INTO bookings (tour_id,tourist_id,booking_date)
    #  VALUES ($1,$2,$3) RETURNING id"
    # values = [@tour_id,@tourist_id,@booking_date]

  end

  def get_tourist()
    sql = "SELECT * FROM tourists where id = $1"
    value = [@tourist_id]
    result = SqlRunner.run(sql,value).first
    tourist = Tourist.new(result)
    return tourist
  end

  def get_tour()
    sql = "SELECT * FROM tours where id = $1"
    value = [@tour_id]
    result = SqlRunner.run(sql,value).first
    tour = Tour.new(result)
    return tour
  end

end
