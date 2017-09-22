class KillUserIdFour < ActiveRecord::Migration
  def change
    Query.where(user_id: 4).update_all(user_id: nil)
  end
end
