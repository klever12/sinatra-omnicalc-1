require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @the_apr = params.fetch("user_apr").to_f
  @the_years = params.fetch("user_years").to_i
  @the_pv = params.fetch("user_pv").to_f

  handled_apr = (@the_apr / 100) / 12
  handled_years = @the_years * 12

  numerator = handled_apr * @the_pv
  denominator = 1 - ((1 + handled_apr) ** -handled_years)
 
  @the_result = numerator / denominator

  erb(:payment_result)
end
