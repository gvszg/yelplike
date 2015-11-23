Fabricator(:review) do
  rating { [1,2,3].sample }
  content { Faker::Lorem.paragraph(3) }
end