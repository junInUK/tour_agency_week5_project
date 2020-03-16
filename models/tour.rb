require_relative('../db/sql_runner.rb')

class Tour

  attr_reader :id
  attr_accessor :name, :start_date, :days, :price, :pic_url

  def initialize(tour)
    @id         = tour['id'].to_i if tour['id']
    @name       = tour['name']
    @start_date = tour['start_date']
    @days       = tour['days'].to_i
    @price      = tour['price'].to_i
    @pic_url    = tour['pic_url']
  end

  def save()
    # binding.pry
    sql = "INSERT INTO tours(name,start_date,days,price,pic_url)
          VALUES($1,$2,$3,$4,$5) RETURNING id"
    values = [@name,@start_date,@days,@price,@pic_url]
    tour = SqlRunner.run(sql,values).first
    @id = tour['id'].to_i
    return @id
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
    sql = "UPDATE tours set (name,start_date,days,price,pic_url)
    = ($1,$2,$3,$4,$5) WHERE id = $6"
    values = [@name,@start_date,@days,@price,@pic_url,@id]
    SqlRunner.run(sql,values)

  end

end
