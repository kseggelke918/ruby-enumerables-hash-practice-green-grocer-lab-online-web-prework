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
      binding.pry 
      name = coupon[:item] 
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], 
          :clearance => cart[name][:clearance], :count => coupon[:num]} 
        end 
      cart[name][:count] = cart[name][:count] - coupon[:num]
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

