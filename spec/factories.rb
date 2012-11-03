FactoryGirl.define do
  factory :user do
    name "George Spelvin"
    password "foobar"
    password_confirmation "foobar"
    rank "TC"
    username "spelvin1"
  	
  	factory :tcc do
    	rank "TCC"
  	end
  end
end