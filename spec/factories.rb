FactoryGirl.define do
  factory :cabin do
    name "Test cabin"
  end

  factory :user do
    name "testiukko"
    password "hello"
    password_confirmation "hello"
  end
end