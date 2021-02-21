class Address < ApplicationRecord
  belongs_to :purchase
  bolongs_to :prefecture
end
