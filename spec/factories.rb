FactoryGirl.define do
  factory :user do
    name     "Colin Tremblay"
    password "foobar"
    password_confirmation "foobar"
    rank "TC"
    username "username"
  end
end