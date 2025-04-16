require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/process_roll") do
  @dice  = params["dice"].to_i
  @sides = params["sides"].to_i
  @rolls = roll(@sides, @dice)

  erb(:results)
end

def roll(sides, dice)
  rolls = []
  dice.times do
    roll = rand(1..sides)
    rolls.push(roll)
  end
  return rolls
end
