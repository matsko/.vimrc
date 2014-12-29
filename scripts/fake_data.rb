#!/Users/matias/.rbenv/shims/ruby

require 'rubygems'
require 'faker'

def resolve_method(method) 
  case method
    when 'name'       ; "Faker::Name.name"
    when 'first_name' ; "Faker::Name.first_name"
    when 'last_name'  ; "Faker::Name.last_name"
    when 'title'      ; "Faker::Name.title"
    when 'image'      ; "Faker::Avatar.image"
    when 'email'      ; "Faker::Internet.email"
    when 'url'        ; "Faker::Internet.url"
    when 'ip'         ; "Faker::Internet.ip_v4_address"
    when 'phone'      ; "Faker::PhoneNumber.cell_phone"
    when 'country'    ; "Faker::Address.country"
    when 'city'       ; "Faker::Address.city"
    when 'state'      ; "Faker::Address.state"
    when 'color'      ; "Faker::Commerce.color"
    when 'password'   ; "Faker::Internet.password"
    when 'age'        ; "fake_age"
    when 'location'   ; "fake_location"
    end
end

def fake_age
  rand(1..99).to_s
end

def fake_location
  [
    Faker::Address.city,       
    Faker::Address.state,      
    Faker::Address.country
  ].join(", ")
end

limit = (ARGV[0] || 10).to_i - 1

methods = []
for i in 1..ARGV.length-1 do
  methods.push(resolve_method(ARGV[i]))
end

names = []
for i in 0..limit do
  str = ""
  methods.each do |method|
    str += " " if str.length > 0
    str += eval(method)
  end
  puts str
end
