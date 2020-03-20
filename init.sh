dropdb tour_agency
createdb tour_agency
psql -d tour_agency -f db/tour_agency.sql
psql -d tour_agency -f db/get_price.sql
psql -d tour_agency -f db/function.sql
ruby db/seeds.rb
ruby app.rb
