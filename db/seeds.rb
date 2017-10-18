%w(Classroom Hall Gym Closet Computer Conference).each do |name|
  RoomType.create!(name: name)
end

admin = AdminUser.create!(email: 'admin@encoredevlabs.com', password: 'password', password_confirmation: 'password')

org = Organization.create!(name: 'Maplewood Public Schools')
classroom = RoomType.where(name: 'Classroom').first
role = Role.create!(name: 'Custodian')
user = User.create!(email: 'ankur@maplewoodschools.org', password: 'password', password_confirmation: 'password', organization: org, role: role)
floor = Floor.create!(name: "First")
loc = Location.create!(organization: org, name: 'High School', street: '123 Main Street', city: 'Maplewood', state: 'NJ', zip_code: '07040')
room = Room.create!(name: '101', location: loc, room_type: classroom, floor: floor)
sensor = Sensor.create!(name: 'Raspberry Pi 3', uuid: 'C4:73:1E:17:F4:35', room: room, lat: 0, lon: 0)
