require('pg')
require('logger')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      logger = Logger.new("my_log.txt")
      logger.info(sql)
      db = PG.connect({ dbname: 'tour_agency', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
