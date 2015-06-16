#!/Users/matsko/.rbenv/shims/ruby

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
    when 'rand'       ; "number"
    when 'number'     ; "number"
    when 'location'   ; "fake_location"
    when 'characters' ; "Faker::Lorem.characters"
    when 'word'       ; "Faker::Lorem.word"
    when 'sentence'   ; "fake_sentence"
    when 'paragraph'  ; "fake_paragraph"
    when 'date'       ; "fake_date"
    end
end

def fake_date(from = 0.0, to = Time.now)
  Time.at(from + rand * (to.to_f - from.to_f)).to_s
end

def fake_age
  number([1,99])
end

def number(args)
  min, max = args
  rand(min.to_i..max.to_i).to_s
end

def fake_sentence(total=1)
  total = total.is_a?(Array) ? total.first : total
  Faker::Lorem.sentence(total.to_i)
end

def fake_paragraph(total=1)
  total = total.is_a?(Array) ? total.first : total
  Faker::Lorem.paragraph(total.to_i)
end

def fake_location
  [
    Faker::Address.city,       
    Faker::Address.state,      
    Faker::Address.country
  ].join(", ")
end

limit = (ARGV[0] || 10).to_i - 1

separator = ' '
if (ARGV.length == 3)
  separator = ARGV[1].to_s
end

methods = []
ARGV.last.split(',').each do |m|
  method, *args = m.split(":")
  methods.push([resolve_method(method), args])
end

names = []
for i in 0..limit do
  str = ""
  methods.each do |row|
    method, data = row
    str += separator if str.length > 0
    if data.nil? || data.empty?
      val = eval(method)
    else
      val = send(method, data)
    end
    val = val.join("\n") if val.is_a?(Array)
    str += val
  end
  puts str
end
