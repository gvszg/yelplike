Fabricator(:business) do
  name { Faker::Commerce.product_name }
  address { Faker::Address.street_address }
  region { Faker::Address.state }
  country { Faker::Address.country }
end