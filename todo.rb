require_relative 'config/application'
require_relative 'app/models/task'


# puts "Put your application code in #{File.expand_path(__FILE__)}"


command = ARGV.shift
values  = ARGV[0..-1].join(" ")

 case command
  when "add"
    Task.create description: values,
                complete: false
  when "delete"
    Task.find(values.to_i).delete
  when "list"
    Task.all.each do |task|
      if task.complete == true
        puts "#{task.id}. [X] #{task.description}"
      elsif task.complete == false
        puts "#{task.id}. [ ]  #{task.description}"
      end
    end
  when "complete"
    a = Task.find(values.to_i)
    a.complete = true
    a.save
  end
