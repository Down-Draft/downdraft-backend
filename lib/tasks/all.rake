require 'csv'
require 'pry'

namespace :csv_load do
  desc "Seed database with all csv files"
  task correction_seq_id: :environment do
    ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  task all: :environment do
    Beer.destroy_all
    Style.destroy_all
    Rake::Task["csv_load:correction_seq_id"].invoke

    CSV.foreach("db/data/styles.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Style.create(row.to_hash)
    end
    
    CSV.foreach("db/data/beers.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
      Beer.create(brewery_id: row[:brewery_id], name: row[:name], style_id: row[:style_id], abv: row[:abv], description: row[:description])
    end
  end 
end
