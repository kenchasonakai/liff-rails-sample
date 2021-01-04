class Log < ApplicationRecord
  validates :user_id, presence: true
  validates :grnv_id, presence: true
  belongs_to :user
end
