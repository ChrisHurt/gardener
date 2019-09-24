require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/plant'
require_relative 'models/task'
require_relative 'models/todo'
require_relative 'models/location'

def generateLocation user
    location = Location.new
    location.user_id = user.id
    location.latitude = -45
    location.longitude = 90
    location.save
    return
end

u = User.new()
u.username = 'Chris'
u.email = '123@gmail.com'
u.password = '123'
u.save

generateLocation(u)

# seed data for plants
p1 = Plant.new
p2 = Plant.new
p3 = Plant.new
p4 = Plant.new
p5 = Plant.new
p6 = Plant.new
p7 = Plant.new
p8 = Plant.new
p9 = Plant.new
p10 = Plant.new

p1.common_name = 'Yellow Peach Tree'
p2.common_name = 'Lemon Tree'
p3.common_name = 'Dwarf Red Fuji Apple Tree'
p4.common_name = 'Apricot Tree'
p5.common_name = 'Sultan Blood Plum Tree'
p6.common_name = 'Pomegranate Tree'
p7.common_name = 'Olive Tree'
p8.common_name = 'Kaffir Lime Tree'
p9.common_name = 'Orange Tree'
p10.common_name = 'Blueberry Plant'

p1.scientific_name = 'Prunus Persica'
p2.scientific_name = 'Citrus × limon'
p3.scientific_name = 'Malus domestica'
p4.scientific_name = 'Prunus Armeniaca'
p5.scientific_name = 'Prunus salicina-Satsuma'
p6.scientific_name = 'Punica granatum'
p7.scientific_name = 'Olea europaea'
p8.scientific_name = 'Citrus hystrix'
p9.scientific_name = 'Citrus X sinensis'
p10.scientific_name = 'Cyanococcus'

p1.image_url = 'https://cdn.thetreecenter.com/c/uploads/peach-glohaven-1.jpg'
p2.image_url = 'https://gardeners.s3.amazonaws.com/p/FRLEM22602_3.jpg'
p3.image_url = 'https://www.plantnet.com.au/wp-content/uploads/plantnet-rootstock-apple-Red-Fuji.jpg'
p4.image_url = 'https://www.yalcafruittrees.com.au/wp-content/uploads/Trevatt-apricot.jpg'
p5.image_url = 'https://www.waimeanurseries.co.nz/assets/our-products/fruit-trees/plums/ruby-queen/_resampled/FillWyIzNTQiLCIyNjUiXQ/Plum-Ruby-Queen-2.JPG'
p6.image_url = 'https://d6p0gevo8s9lm.cloudfront.net/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/p/o/pomegranate-tree-fruit1-750x750.jpg'
p7.image_url = 'https://smhttp-ssl-17653.nexcesscdn.net/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/f/t/ft716-web.jpg'
p8.image_url = 'https://d6p0gevo8s9lm.cloudfront.net/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/i/citrus-hystrix-kaffir-lime750x750.jpg'
p9.image_url = 'https://www.abc.net.au/news/image/10032956-3x2-940x627.jpg'
p10.image_url = 'https://images.homedepot-static.com/productImages/e444eaec-c06c-4669-8918-7623e5db1586/svn/van-zyverden-fruit-trees-plants-83935-64_1000.jpg'



p1.save
p2.save
p3.save
p4.save
p5.save
p6.save
p7.save
p8.save
p9.save
p10.save


# seed data for tasks

t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new
t5 = Task.new

t1.plant_id = p1.id
t2.plant_id = p1.id
t3.plant_id = p1.id
t4.plant_id = p1.id
t5.plant_id = p1.id

t1.name = 'Prune'
t2.name = 'Spray Pesticide'
t3.name = 'Fertilize'
t4.name = 'Lay Beetle Traps'
t5.name = 'Fertilize'

t2.description = 'Copper spray eg. copper hydroxide or copper oxychloride'
t3.description = 'High nitrogen (e.g. 22:5:8 NPK)'
t4.description = 'Carpophilus Catcha Trapping System - attract-and-kill traps'
t5.description = 'High nitrogen (e.g. 22:5:8 NPK)'

t1.due_date = '2020-06-30'
t2.due_date = '2020-07-07'
t3.due_date = '2020-09-07'
t4.due_date = '2020-09-14'
t5.due_date = '2020-11-30'

t1.save
t2.save
t3.save
t4.save
t5.save

# these tasks are for lemons.

t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new
t5 = Task.new
t6 = Task.new
t7 = Task.new
t8 = Task.new

t1.plant_id = p2.id
t2.plant_id = p2.id
t3.plant_id = p2.id
t4.plant_id = p2.id
t5.plant_id = p2.id
t6.plant_id = p2.id
t7.plant_id = p2.id
t8.plant_id = p2.id

t1.name = 'Fertilize'
t2.name = 'Iron Sulphate'
t3.name = 'Iron Sulphate'
t4.name = 'Seaweed Solution'
t5.name = 'Fertilize'
t6.name = 'Iron Sulphate'
t7.name = 'Fertilize'
t8.name = 'Fertilize'

t1.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t2.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t3.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t4.description = 'Water in well with a diluted seaweed solution'
t5.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t6.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t7.description = 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone'
t8.description = 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone'

t1.due_date = '2020-01-07'
t2.due_date = '2020-02-07'
t3.due_date = '2020-03-31'
t4.due_date = '2020-02-07'
t5.due_date = '2020-09-14'
t6.due_date = '2020-10-07'
t7.due_date = '2020-10-21'
t8.due_date = '2020-11-30'

t1.save
t2.save
t3.save
t4.save
t5.save
t6.save
t7.save
t8.save

# these tasks are for Fuji Apples.

t1 = Task.new
t2 = Task.new
t3 = Task.new

t1.plant_id = p3.id
t2.plant_id = p3.id
t3.plant_id = p3.id

t1.name = 'Fertilize'
t2.name = 'Prune'
t3.name = 'Fertilize'

t1.description = 'Manures and compost or Dynamic Lifter for Fruit & Citrus'
t3.description = 'Manures and compost or Dynamic Lifter for Fruit & Citrus'

t1.due_date = '2020-01-21'
t2.due_date = '2020-06-30'
t3.due_date = '2020-09-07'

t1.save
t2.save
t3.save

# these tasks are for Apricots.

t1 = Task.new
t2 = Task.new

t1.plant_id = p4.id
t2.plant_id = p4.id

t1.name = 'Prune'
t2.name = 'Spray Pesticide'

t2.description = 'Copper spray eg. copper hydroxide or copper oxychloride'

t1.due_date = '2020-06-30'
t2.due_date = '2020-07-07'

t1.save
t2.save

# these tasks are for sultan blood plum

t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new

t1.plant_id = p5.id
t2.plant_id = p5.id
t3.plant_id = p5.id
t4.plant_id = p5.id

t1.name = 'Fertilize'
t2.name = 'Prune'
t3.name = 'Spray Pesticide'
t4.name = 'Fertilize'

t1.description = 'Fruit fertilizer'
t3.description = 'Copper spray eg. copper hydroxide or copper oxychloride'
t4.description = 'General fertilizer'

t1.due_date = '2020-04-14'
t2.due_date = '2020-06-30'
t3.due_date = '2020-07-07'
t4.due_date = '2020-09-04'

t1.save
t2.save
t3.save
t4.save

# 6 - pomegranate tree tasks

t1 = Task.new
t2 = Task.new

t1.plant_id = p6.id
t2.plant_id = p6.id

t1.name = 'Prune'
t2.name = 'Fertilize'

t2.description = 'In second year, apply 2 ounces of nitrogen per plant. For each successive year, increase the feeding by an additional ounce. By the time the tree is five years old, 6-8 ounces of nitrogen should be applied to each tree in late winter prior to leaf emergence.'

t1.due_date = '2020-08-07'
t2.due_date = '2020-08-21'

t1.save
t2.save

# 7 - 'Olive Tree' tasks

t1 = Task.new
t2 = Task.new

t1.plant_id = p7.id
t2.plant_id = p7.id

t1.name = 'Prune'
t2.name = 'Fertilize'

t2.description = 'Citrus Fertilizer'

t1.due_date = '2020-06-30'
t2.due_date = '2020-09-07'

t1.save
t2.save

#8 Kaffir Lime Tree tasks
t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new
t5 = Task.new
t6 = Task.new
t7 = Task.new
t8 = Task.new

t1.plant_id = p8.id
t2.plant_id = p8.id
t3.plant_id = p8.id
t4.plant_id = p8.id
t5.plant_id = p8.id
t6.plant_id = p8.id
t7.plant_id = p8.id
t8.plant_id = p8.id

t1.name = 'Fertilize'
t2.name = 'Iron Sulphate'
t3.name = 'Iron Sulphate'
t4.name = 'Seaweed Solution'
t5.name = 'Fertilize'
t6.name = 'Iron Sulphate'
t7.name = 'Fertilize'
t8.name = 'Fertilize'

t1.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t2.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t3.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t4.description = 'Water in well with a diluted seaweed solution'
t5.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t6.description = 'One tablespoon in 4 and half litres of water and apply to trees'
t7.description = 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone'
t8.description = 'Poultry Manure- Give half a handful per square metre and sprinkle  very thinly around the root zone'

t1.due_date = '2020-01-07'
t2.due_date = '2020-02-07'
t3.due_date = '2020-03-31'
t4.due_date = '2020-02-07'
t5.due_date = '2020-09-14'
t6.due_date = '2020-10-07'
t7.due_date = '2020-10-21'
t8.due_date = '2020-11-30'

t1.save
t2.save
t3.save
t4.save
t5.save
t6.save
t7.save
t8.save


# 9.Orange Tree tasks
t1 = Task.new
t2 = Task.new
t3 = Task.new
t4 = Task.new
t5 = Task.new
t6 = Task.new
t7 = Task.new
t8 = Task.new
t9 = Task.new
t10 = Task.new
t11 = Task.new
t12 = Task.new

t1.plant_id = p9.id
t2.plant_id = p9.id
t3.plant_id = p9.id
t4.plant_id = p9.id
t5.plant_id = p9.id
t6.plant_id = p9.id
t7.plant_id = p9.id
t8.plant_id = p9.id
t9.plant_id = p9.id
t10.plant_id = p9.id
t11.plant_id = p9.id
t12.plant_id = p9.id

t1.name = 'Fertilize'
t2.name = 'Ammonium sulfate'
t3.name = 'Fertilize'
t4.name = 'Ammonium sulfate'
t5.name = 'Fertilize'
t6.name = 'Ammonium sulfate'
t7.name = 'Fertilize'
t8.name = 'Ammonium sulfate'
t9.name = 'Fertilize'
t10.name = 'Ammonium sulfate'
t11.name = 'Fertilize'
t12.name = 'Ammonium sulfate'

t1.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t2.description = '1 tablespoon diluted in water per plant'
t3.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t4.description = '1 tablespoon diluted in water per plant'
t5.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t6.description = '1 tablespoon diluted in water per plant'
t7.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t8.description = '1 tablespoon diluted in water per plant'
t9.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t10.description = '1 tablespoon diluted in water per plant'
t11.description = 'Poultry Manure- Give half a handful per square metre and sprinkle very thinly around the root zone'
t12.description = '1 tablespoon diluted in water per plant'

t1.due_date = '2020-01-07'
t2.due_date = '2020-01-14'
t3.due_date = '2020-02-07'
t4.due_date = '2020-02-14'
t5.due_date = '2020-09-07'
t6.due_date = '2020-09-14'
t7.due_date = '2020-10-07'
t8.due_date = '2020-10-14'
t9.due_date = '2020-11-07'
t10.due_date = '2020-11-14'
t11.due_date = '2020-12-07'
t12.due_date = '2020-12-14'

t1.save
t2.save
t3.save
t4.save
t5.save
t6.save
t7.save
t8.save
t9.save
t10.save
t11.save
t12.save

# 10.Blueberry Plant' tasks
t1 = Task.new

t1.plant_id = p10.id

t1.name = 'Fertilize'

t1.description = 'Organic fertilizers like blood meal or fish meal to provide nitrogen. Sphagnum peat or coffee grounds will help to provide acidity. Bone meal and powdered seaweed to fertilize blueberries can provide the potassium and phosphorus'

t1.due_date = '2020-09-14'

t1.save


# Add u1 Todo

# p1.tasks.each do |task|
#     td = Todo.new
#     td.user_id = u1.id
#     td.plant_id = task.plant_id
#     td.task_id = task.id
#     td.complete = 0;
#     td.save
# end

# p2.tasks.each do |task|
#     td = Todo.new
#     td.user_id = u1.id
#     td.plant_id = task.plant_id
#     td.task_id = task.id
#     td.complete = 0;
#     td.save
# end

# p3.tasks.each do |task|
#     td = Todo.new
#     td.user_id = u1.id
#     td.plant_id = task.plant_id
#     td.task_id = task.id
#     td.complete = 0;
#     td.save
# end
# # Add u2 Todo

# p1.tasks.each do |task|
#     td = Todo.new
#     td.user_id = u2.id
#     td.plant_id = task.plant_id
#     td.task_id = task.id
#     td.complete = 0;
#     td.save
# end
