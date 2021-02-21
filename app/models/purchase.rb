class Purchase < ApplicationRecord
  belongs_to :user
  bolongs_to :item
  has_on :address
end
