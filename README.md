# thermostat

![Metrics Dashboard](https://raw.githubusercontent.com/ankurp/thermostat/master/public/screenshot.png)

This repository has server code, where Raspberry Pi units placed in the public schools report temperature data to. The site has an admin portal to configure

* Users (ie. Ankur or other users who will receive alerts)
* Organizations (ie. Maplewood Public School or SOMSD)
* Locations (ie. Tuscan Elementary School)
* Rooms (ie. Room 201)
* Sensors (ie. Raspberry Pi 3 which is sending the data)
* Roles (ie. Custodian, Admin, etc. who have preference to receive alert for the location, school, they belong to)
* Notification Trigger (ie. Trigger alert when temperature in this school goes above 85 degrees or trigger alert when temperature goes below a certain temperature)

## Getting Started

1. `bundle`
1. `rake db:create`
1. `rake db:migrate`
1. `rake db:seed`
1. `rails s`
