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
    # if !consolidated[cart[cart_counter]]
    #   consolidated << cart[cart_counter]
    #   consolidated[cart_counter][:count] = 1
    # else
    #   consolidated[cart_counter][:count] += 1
    # end
    # cart_counter += 1
    consolidated_item = find_item_by_name_in_collection(cart[cart_counter][:item], consolidated)
    if consolidated_item
      consolidated_item [:count] += 1
    else
      consolidated_item = {
        item: cart[cart_counter][:item],
        price: cart[cart_counter][:price],
        clearance: cart[cart_counter][:clearance],
        count: 1
      }
      consolidated << consolidated_item
    end
    cart_counter += 1
  end
  # binding.pry
  consolidated
end

def apply_coupons(cart, coupons)
  # binding.pry
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart_counter = 0
  while cart_counter < coupons.length do
    cart_item = find_item_by_name_in_collection(coupons[cart_counter][:item], cart)
    discount_name = "#{coupons[cart_counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(discount_name, cart)
    if cart_item && cart_item[:count] >= coupons[cart_counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[cart_counter][:num]
        cart_item[:count] -= coupons[cart_counter][:num]
      else
        cart_item_with_coupon = {
          item: discount_name,
          price: coupons[cart_counter][:cost] / coupons[cart_counter][:num],
          clearance: cart_item[:clearance],
          count: coupons[cart_counter][:num]
          }
        cart_item[:count] -= coupons[cart_counter][:num]
        cart << cart_item_with_coupon
      end
    # cart_item_with_coupon[:price].round(2)
    end
    cart_counter += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart_counter = 0
  while cart_counter < cart.length do
    if cart[cart_counter][:clearance]
      cart[cart_counter][:price] *= 0.8
      cart[cart_counter][:price].round(2)
    end
    cart_counter += 1
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  consolidated = consolidate_cart(cart)
  # puts consolidated
  couponed = apply_coupons(consolidated, coupons)
  # puts couponed
  final_cart = apply_clearance(couponed)
  # puts final_cart
  cart_counter = 0
  sub_total = 0
  total = 0
  while cart_counter < final_cart.length do
    item_counter = 0
    final_cart[cart_counter][:price].round(2)
    while item_counter < final_cart[cart_counter][:count] do
      sub_total += final_cart [cart_counter][:price]
      item_counter += 1
    end
    cart_counter += 1
  end
  if sub_total > 100
    total = sub_total * 0.9
    total.round(2)
  else
    total = sub_total
    total.round(2)
  end
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  total
end
