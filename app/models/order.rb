class Order < ActiveRecord::Base
  
  belongs_to :meme
  belongs_to :subscription

end
