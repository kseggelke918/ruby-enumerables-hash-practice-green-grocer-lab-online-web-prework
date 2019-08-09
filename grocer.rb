require "pry"
def consolidate_cart(cart)
  consolidated_hash = {}
  cart.each do |item|
    if consolidated_hash[item.keys[0]] 
     consolidated_hash[item.keys[0]][:count] +=1 
    else 
      consolidated_hash[item.keys[0]] = {
        price: item.values[0][:price],
        clearance: item.values[0][:clearance], 
        count: 1 
      } 
    end
  end
  consolidated_hash
end 
  
  

def apply_coupons(cart, coupons)
  coupon_hash = {}
  coupons.each do |coupon|
    food = coupon[:item]
    coupon_hash = {
      price: coupon[:cost],
      clearance: "true",
      count: coupon[:num]
  }
    if cart.has_key?(food)
      coupon_hash[:clearance] = cart[food][:clearance]
        if cart[food][:count] >= coupon_hash[:count]
          coupon_hash[:count]= cart[food][:count] - coupon_hash[:count]
        end 
        cart[food + " W/COUPON"] = coupon_hash
    end 
  end
  return cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

