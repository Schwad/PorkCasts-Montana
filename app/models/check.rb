class Check < ActiveRecord::Base
  belongs_to :query
  validates :query_id, presence: true
end
