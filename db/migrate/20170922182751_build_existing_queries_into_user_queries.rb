class BuildExistingQueriesIntoUserQueries < ActiveRecord::Migration
  def change
    puts "Total users: #{User.count}"
    User.all.each do |user|
      if user.id != 4
        puts "Now doing user #{user.id}"
        user.queries.each do |query|
          UserQuery.create(user_id: user.id, query_id: query.id) unless UserQuery.exists?(user_id: user.id, query_id: query.id)
        end
      end
    end
  end
end
