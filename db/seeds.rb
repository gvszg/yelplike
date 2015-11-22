# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kohimomento = Business.create(name: "Kohimomento", address: "No.270, Zhongjian W. Rd., Douliu City", region: "Yunlin County", country: "Taiwan")

tos = Business.create(name: "TOS Café", address: "No.96, Hankou Rd., Douliu City", region: "Yunlin County", country: "Taiwan")

mango = Business.create(name: "芒果咖啡", address: "No.310, Sec. 3, University Road, Douliu City", region: "Yunlin County", country: "Taiwan")

mojo = Business.create(name: "The Factory Mojocoffee", address: "No.22, Jingcheng 6th St., West Dist.", region: "Taichung City", country: "Taiwan")

lulu = Business.create(name: "Café LuLu", address: 'No.217, Wuchang St., North Dist.', region: "Taichung City", country: "Taiwan")

coffeeya = Business.create(name: "咖啡葉", address: "No.95-5, Xi’an St., Fengyuan Dist.", region: "Taichung City", country: "Taiwan")
