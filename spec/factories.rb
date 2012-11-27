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

    factory :user2 do
      name "Simon Kanter"
      password "password"
      password_confirmation "password"
      rank "TC"
      username "kantersi"
    end
  end

  factory :shift do
    lab_id "1"
    filled "1"
    starttime "Time.now + 1k"
    endtime "Time.now + 2k"
    userid "1"
  end

end
