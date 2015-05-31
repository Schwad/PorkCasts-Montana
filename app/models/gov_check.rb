class GovCheck < ActiveRecord::Base
  serialize :properties, JSON
end
