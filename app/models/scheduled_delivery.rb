class ScheduledDerivery < ActiveHash::Base
  self.data = [
    {id: 0, derivery: '−−−'}
    {id: 1, derivery: '1〜2日で発送'}
    {id: 2, derivery: '2〜3日で発送'}
    {id: 3, derivery: '4〜7日で発送'}
  ]

  include ActiveHash::Associations
  has_many :items

end