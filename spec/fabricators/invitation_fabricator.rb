Fabricator(:invitation) do
  recipient_name { Faker::Name.name }
  recipient_email { Faker::Internet.email }
  messages { Faker::Lorem.words(3).join(" ") }
end