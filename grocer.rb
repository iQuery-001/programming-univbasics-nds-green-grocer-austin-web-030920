require 'pry'

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  item_counter = 0
  while item_counter < collection.length do
    if name == collection[item_counter][:item]
      return collection[item_counter]
    end
    item_counter += 1
  end
  nil
  # binding.pry
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  consolidated = []
  cart_counter = 0
  while cart_counter < cart.length do
    if !consolidated[cart[cart_counter]]
      consolidated << cart[cart_counter]
      consolidated[cart_counter][:count] = 1
    else
      consolidated[cart_counter][:count] += 1
    end
    cart_counter += 1
  end
  binding.pry
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
