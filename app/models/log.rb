class Log < ApplicationRecord
  validates :user_id, presence: true
  validates :grnv_bar_info_id, presence: true
  belongs_to :user
  belongs_to :grnv_bar_info
end
