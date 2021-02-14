class ScheduledDelivery < ActiveHash::Base
  self.data = [
    {id: 0, delivery: '−−−'},
    {id: 1, delivery: '1〜2日で発送'},
    {id: 2, delivery: '2〜3日で発送'},
    {id: 3, delivery: '4〜7日で発送'}
  ]

  include ActiveHash::Associations
  has_many :items

end