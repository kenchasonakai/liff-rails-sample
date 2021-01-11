class GrnvBarInfo < ApplicationRecord
  validates :grnv_id, presence: true
  validates :name, presence: true
  has_many :logs
end
