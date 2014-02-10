require 'faker'
users = %w{Juan Joe Lorena Lydia Justin}

users.each do |name|
  u = User.create(name: name,
                  email: Faker::Internet.email(name = nil),
                  password_hash: Faker::Internet.password)
  user_id = u.id
  Album.create(user_id: user_id, name: 'Default')
end


10.times do |i|
  album_id = (i+2)/2
  Photo.create(album_id: album_id, name: Faker::Lorem.words(num =3, supplemental = true).join(' '))
end
