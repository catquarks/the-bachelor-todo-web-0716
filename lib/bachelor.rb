require 'json'
require 'pry'

def get_first_name_of_season_winner(data, season)

	data[season].each do |contestant|
		if contestant["status"] == "Winner"
			return contestant["name"].split(" ")[0]
		end
	end

  #binding.pry
end

def get_contestant_name(data, occupation)
	data.each do |season, contestants|
		contestants.each do |contestant|
			if contestant["occupation"] == occupation
				return contestant["name"]
			end
		end
	end

  #binding.pry
end

def count_contestants_by_hometown(data, hometown)
  home_gals = 0
  data.each do |season, contestants|
  	contestants.each do |contestant|
  		if contestant["hometown"] == hometown
  			home_gals += 1
  		end
  	end
  end
  #binding.pry
  home_gals
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
  	contestants.find do |contestant|
			if contestant["hometown"] == hometown
				return contestant["occupation"]
			end
		end
	end

  #binding.pry

end

def get_average_age_for_season(data, season)
	sum = 0
  data[season].each do |contestant|
  	sum += contestant["age"].to_f
  end
  avg = (sum/data[season].length).round

end

file = File.read('spec/fixtures/contestants.json')

data_hash = JSON.parse(file)

get_average_age_for_season(data_hash, "season 10")