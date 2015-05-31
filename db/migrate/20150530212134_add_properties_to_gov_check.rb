class AddPropertiesToGovCheck < ActiveRecord::Migration
  def change
    add_column :gov_checks, :properties, :text
  end
end
