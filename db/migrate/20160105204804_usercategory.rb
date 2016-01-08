class Usercategory < ActiveRecord::Migration
  def change

    create_table 'categories_users', :id=> false do |t|
      t.column 'category_id',:integer
      t.column 'user_id',:integer
    end
end
end
