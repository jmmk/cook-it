FactoryGirl.define  do
  factory :recipe do
    title 'Super Chicken'
    after(:build) do |recipe|
      recipe.ingredients.build(name: '1 Chicken')
      recipe.ingredients.build(name: '2 Onions')
      recipe.ingredients.build(name: '3 Peppers')
      recipe.ingredients.build(name: '5 Jelly')
    end
  end

  factory :user do
    email 'asd@asd.com'
    password 'password'
    password_confirmation 'password'
  end
end
