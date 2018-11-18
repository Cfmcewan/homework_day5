# # #1
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

#2
def total_cash(name)
  return name[:admin][:total_cash]
end

#3+4
def add_or_remove_cash(pet_shop, amount)
  cash = pet_shop[:admin][:total_cash] += amount
  return cash
end

#5
def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

#6
def increase_pets_sold(pet_shop, num_sold)
  sold = pet_shop[:admin][:pets_sold] += num_sold
  return sold
end

#7
def stock_count(pet_shop)
  count = pet_shop[:pets].length
  return count
end

#8+9
def pets_by_breed(pet_shop, breed)
  pets_match = []
    for pet in pet_shop[:pets]
      if pet[:breed].include?(breed)
      pets_match << pet
    end
  end
  return pets_match
end

#10+11
def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name].include?(pet_name)
      return pet
    end
  end
    return nil
end

#12
def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name].include?(pet_name)
      pet_shop[:pets].delete(pet)
    end
  end
end

#13
def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] <<  new_pet
  stock_count = pet_shop[:pets].length
end

#14
def customer_cash(customer)
  return customer[:cash]
end

#15
def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
  return customer[:cash]
end

#16
def customer_pet_count(customer)
  count = customer[:pets].count
  return count
end

#17
def add_pet_to_customer(customer, new_pet)
 customer[:pets].push(new_pet)
 return customer_pet_count(customer)
end

# # # OPTIONAL

#1+2
def customer_can_afford_pet(customer, new_pet)
  can_by_let = customer[:cash] >= new_pet[:price]
return can_by_let
end

# #3
def sell_pet_to_customer(pet_shop, new_pet, customer)
# check if pet to sell to customer exists in the pet shop:
  pet = find_pet_by_name(pet_shop, new_pet)
  if pet != nil  
      customer_pet_count(customer) += customer[:pets].count
      pets_sold(pet_shop) += pet_shop[:admin][:pets_sold]
      customer_cash(customer) -= pet_shop[:price]
      total_cash(pet_shop) += pet_shop[:price]
    end
    return
      customer_pet_count(customer)
      pets_sold(pet_shop)
      customer_cash(customer)
      total_cash(pet_shop)
  end








  #
  # #4
  #   def test_sell_pet_to_customer__pet_not_found
  #     customer = @customers[0]
  #     pet = find_pet_by_name(@pet_shop,"Dave")
  #
  #     sell_pet_to_customer(@pet_shop, pet, customer)
  #
  #     assert_equal(0, customer_pet_count(customer))
  #     assert_equal(0, pets_sold(@pet_shop))
  #     assert_equal(1000, customer_cash(customer))
  #     assert_equal(1000, total_cash(@pet_shop))
  #   end
  #
  # #5
  #   def test_sell_pet_to_customer__insufficient_funds
  #     customer = @customers[1]
  #     pet = find_pet_by_name(@pet_shop,"Arthur")
  #
  #     sell_pet_to_customer(@pet_shop, pet, customer)
  #
  #     assert_equal(0, customer_pet_count(customer))
  #     assert_equal(0, pets_sold(@pet_shop))
  #     assert_equal(50, customer_cash(customer))
  #     assert_equal(1000, total_cash(@pet_shop))
  #   end
  #
  #
