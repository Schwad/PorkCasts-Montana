class CreateGovChecks < ActiveRecord::Migration
  def change
    create_table :gov_checks do |t|

      t.timestamps null: false
    end
  end
end
