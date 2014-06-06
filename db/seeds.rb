# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin

Admin.create(email: 'dccpartes@gmail.com',
 password_digest: '$2a$10$mq5oo0sxm82kgeZhBS1ODuqvgoIXAXNHnFIFiNWItj.Zzl5PJXc.a', role: 'admin')