require_relative("../db/sql_runner")
require('pry-byebug')

class Vehicle

  NoVehicle_REG_NUMBER = "no registrtion number"
  NoVehicle_BRAND      = "no brand"
  NoVehicle_SEATS      = 0

  attr_reader :id
  attr_accessor :reg_number, :brand, :seats

  def initialize(vehicle)
    @id = vehicle['id'].to_i if vehicle['id']
    @reg_number = vehicle['reg_number']
    @brand = vehicle['brand']
    @seats = vehicle['seats'].to_i
  end

  def save()
    sql = "INSERT INTO vehicles (reg_number,brand,seats)
        VALUES ($1,$2,$3) RETURNING id"
    values = [@reg_number,@brand,@seats]
    vehicle_hash = SqlRunner.run(sql,values).first
    @id = vehicle_hash['id']
    return @id
  end

  def self.all()
    sql = "SELECT * FROM vehicles"
    results = SqlRunner.run(sql)
    vehicles = results.map{|vehicle| Vehicle.new(vehicle)}
    return vehicles
  end

  def self.delete_all()
    sql = "DELETE FROM vehicles"
    SqlRunner.run(sql)
  end

  def self.get_by_id(id)
    # binding.pry
    sql = "SELECT * FROM vehicles where id = $1"
    value = [id]
    vehicle_hash = SqlRunner.run(sql,value).first
    if nil == vehicle_hash
      vehicle = Vehicle.new({
        "reg_number" => NoVehicle_REG_NUMBER,
        "brand"      => NoVehicle_BRAND,
        "seats"      => NoVehicle_SEATS
      })
    else
      vehicle = Vehicle.new(vehicle_hash)
    end
    return vehicle
  end

end
