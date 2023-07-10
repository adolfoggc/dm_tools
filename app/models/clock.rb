class Clock < ApplicationRecord
  belongs_to :campaigns
  has_many :counters
end
