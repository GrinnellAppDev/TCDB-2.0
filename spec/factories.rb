FactoryGirl.define do
  factory :user do
    name     "Colin Tremblay"
    email    "trem@grin.edu"
    password "foobar"
    password_confirmation "foobar"
    rank "TC"
  end
end