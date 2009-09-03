class ShopCategory < ActiveRecord::Base
  has_many :shop_categories, :through => :shops
end
