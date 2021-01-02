class ActiveUser
  include ActiveModel::Model
  attr_accessor :id, :name
  validates :id, presence: true
  validates :name, presence: true
end
