class CategoriesNewsJoin < ActiveRecord::Migration
  def change

    create_table 'categories_news', :id=> false do |t|

      t.column 'category_id',:integer
      t.column 'news_id',:integer
    end

  end
end
