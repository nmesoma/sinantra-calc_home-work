require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do 
  erb :home
end

get '/bmi' do
   weight = params["weight"].to_f
   height = params["height"].to_f
@imperial_bmi=(weight * 703)/(height **2)
  erb :bmi
  end

  get '/metric_bmi' do
   weight = params["weight"].to_f
   height = params["height"].to_f
   @metric_bmi = (weight_kg/(height_m**2))
   #metric_bmi = (weight_kg/(height_m**2))

   erb :metric_bmi
  end



  get '/mortgage_calc' do
  principal = params[:principal].to_f
  interest_rate = params[:interest_rate].to_f
  payments = params[:payments].to_f
 

  num_of_payments = (1+interest_rate)**payments
  @mortgage_payment = principal*interest_rate*num_of_payments/(num_of_payments-1)
  erb :mortgage_calc
end
   
   # get '/mortgage_calc' do
   #    p = params["principal"].to_f
   #    i = params["interest"].to_f
   #    n= params["no_of_payments"].to_f
   #    first_cal =i*(1+i)**n
   #    second_cal=((1+i)**n)-1
   #    @each_month_payment =p*(first_cal/second_cal)
   #   erb :mortgage_calc
   # end
   
  

get '/basic_calc' do 
  first = params["first"].to_f
  second = params["second"].to_f
  operator = params["operator"]

  @result = case operator
  when '+' then first + second
  when '-' then first - second
  when '*' then first * second
  when '/' then first / second
  end
  # binding.pry
  erb :basic_calc
end








