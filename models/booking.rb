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

  end

  def save()
    sql = "INSERT INTO bookings (tour_id,tourist_id,booking_date)
     VALUES ($1,$2,$3) RETURNING id"
    values = [@tour_id,@tourist_id,@booking_date]
    booking = SqlRunner.run(sql,values).first
    @id = booking['id'].to_i
    return @id
  end

  def get_tourist_by_tourist_id()
    sql = "SELECT * FROM tourists where id = $1"
    value = [@tourist_id]
    result = SqlRunner.run(sql,value).first
    tourist = Tourist.new(result)
    return tourist
  end

  def get_tour_by_tour_id()
    
  end

end
