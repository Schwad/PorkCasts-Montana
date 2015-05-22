class CreateCheckQueryTasks < ActiveRecord::Migration
  def change
    create_table :check_query_tasks do |t|

      t.timestamps null: false
    end
  end
end
