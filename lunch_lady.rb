# adds class for user to see how much money they have to work with
# user's wallet
class Buyer
  attr_accessor :money

    puts "You have $15. Choose wisely."

  def initialize(money)
    @money = money
  end


end


class Lunchroom

# constant variable - won't change (all caps)
ENTREE_ITEMS = [
  {name: 'Spaghetti', price: 3.99},
  {name: 'Chicken Nuggets', price: 3.99},
  {name: 'Meatloaf', price: 8.99},
  {name: 'Pasta Salad', price: 3.99},
  {name: 'Sushi', price: 9.99}
]

SIDE_ITEMS = [
  {name: 'Pudding', price: 2.99},
  {name: 'Fries', price: 1.99},
  {name: 'Salad', price: 1.99},
  {name: 'Quinoa', price: 4.99},
  {name: 'Green Beans', price: 3.99}
]

DRINKS = [
  {name: 'Water', price: 0.99},
  {name: 'Tea', price: 1.25},
  {name: 'Soda', price: 1.99},
  {name: 'Beer', price: 3.99},
  {name: 'Coffee', price: 2.99}
]
# placeholder array to keep track of users items ordered
ITEMS_ORDERED = []

  def initialize
    @buyer = Buyer.new(15)
    main_entree
    side_1
    side_2
    drink_choice
    final_order
    the_tab
  end

  def item_list(food)
    food.each_with_index do |item, i|
      puts "#{i + 1} #{item[:name]} #{item[:price]}"
    end
  end

  def main_entree
    puts "Choose an Entree: "
    item_list(ENTREE_ITEMS)
      first_choice = gets.strip.to_i
      first_item = ENTREE_ITEMS[first_choice - 1]
      ITEMS_ORDERED << first_item
  end

  def side_1
    puts "Choose your first side dish: "
    item_list(SIDE_ITEMS)
      side_1choice = gets.strip.to_i
      second_item = SIDE_ITEMS[side_1choice - 1]
      ITEMS_ORDERED << second_item
  end

  def side_2
    puts "Choose your second side dish: "
    item_list(SIDE_ITEMS)
      side_2choice = gets.strip.to_i
      third_item = SIDE_ITEMS[side_2choice - 1]
      ITEMS_ORDERED << third_item
  end

  def drink_choice
    puts "What would you like to drink? "
    item_list(DRINKS)
      drink_option = gets.strip.to_i
      fourth_item = DRINKS[drink_option - 1]
      ITEMS_ORDERED << fourth_item
  end

  def final_order
    puts "You ordered:"
    ITEMS_ORDERED.each do |dish|
      print "#{dish[:name]} "
    end
  end

  def the_tab
    total = []
    ITEMS_ORDERED.each do |cost|
    total << cost[:price]
    end
    sum = total.reduce(&:+)
      if @buyer.money < sum
        puts "You do not have enough money in your wallet."
      else
        puts " "
        puts "Your total is: $#{sum}"
        # can't figure out why the wallet sum has multiple decimal numbers 
        puts "Your wallet contains $#{@buyer.money - sum}"
      end
  end
end

Lunchroom.new
