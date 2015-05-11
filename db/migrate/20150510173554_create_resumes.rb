class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :title
      t.integer :year
      t.string :location
      t.text :text
      t.string :artists
      t.string :curator
      t.string :link

      t.timestamps null: false
    end
  end
end
