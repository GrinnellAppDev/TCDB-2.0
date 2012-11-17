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

  factory :shift do
    labid "1"
    filled "1"
    starttime "Time.now + 1k"
    endtime "Time.now + 2k"
    userid "1"
  end

end
