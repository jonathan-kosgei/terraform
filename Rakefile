require 'colorize'
# namespace :stack do
task :plan do
  puts "Displaying the infrastructure that will be created".bold.green
  sh "terraform plan"
end
task :show do
  puts "Displaying your current infrastructure".bold.green
  sh "terraform show"
end
task :apply do
  puts "Creating...".bold.green
  sh "terraform apply"
end
task :destroy do
  puts "Destroying...".bold.green
  sh "terraform destroy"
end
task :reload do
  puts "this will destroy and recreate your current infrastructure".bold.green
  Rake::Task['destroy'].invoke
  Rake::Task['apply'].invoke
end