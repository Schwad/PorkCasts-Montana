class MoveOverQueries < ActiveRecord::Migration
  def change
    puts "Total Queries: #{Query.count}"
    Query.all.each do |query|
      puts "Now doing query #{query.id}"
      if query.user_id != 4 && User.exists?(id: query.user_id)
        user = User.find(query.user_id)
        user.queries << query
        user.save
      end
    end
  end
end
