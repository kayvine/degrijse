class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :blog_title
      t.text :blog_text
      t.date :blog_date
      t.text :blog_link

      t.timestamps null: false
    end
  end
end
