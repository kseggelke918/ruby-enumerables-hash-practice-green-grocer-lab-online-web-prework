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
  coupons.each do |coupon| 
    coupon.each do |attribute, value| 
      food = coupon[:item] 
      if cart[food] && cart[food][:count] >= coupon[:num] 
        if cart["#{food} W/COUPON"] 
          cart["#{food} W/COUPON"][:count] += 1 
        else 
          cart["#{food} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], 
          :clearance => cart[food][:clearance], :count => coupon[:num]} 
        end 
      cart[food][:count] = cart[food][:count] - coupon[:num]
      end 
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

