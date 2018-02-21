# ex. 2
# (1..10).to_a.map do |n|
#     next if n.even?
#     puts n**2
# end


# ex. 3
# p (1..10).to_a.delete_if &:even?

# ex. 4
# p (1..10).inject(:*)

# arr = (1..20).to_a
# p arr.select{ |x| x % 3 == 0 }.map{ |x| x ** 3 }.last(2).max


# ex. 5
# users = [
#     {name: "Tomek", age: 24},
#     {name: "Ada", age: 22},
#     {name: "Ania", age: 40},
#     {name: "Monika", age: 12}
# ]
p users = [
    {"name"=> "Tomek", "age"=> 24},
    {"name"=> "Ada", "age"=> 22},
    {"name"=> "Ania", "age"=> 40},
    {"name"=> "Monika", "age"=> 12}
]
puts "\n"

users_new = [
    {"name"=> "Ada", "age"=> 66},
    {"name"=> "Karol", "age"=> 54}
]

def select_vip_users(users, limit = 1)
    sorted = users.sort_by { |k| k["age"] }
    # sorted = users.sort_by { |k| k[:age] }
    puts sorted.last(limit)
    puts "\n\n"
end

def add_vip_users(users_new, users)
    users.each { |n| users_new << n }
    p users_new
    puts "\n"
    select_vip_users(users_new, 6)  
    puts "\n\n"
end

select_vip_users(users, 4)  
add_vip_users(users_new, users)
