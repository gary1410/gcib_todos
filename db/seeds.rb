require 'faker'

10.times do 
Task.create description: Faker::Company.bs,
            complete: false
end
