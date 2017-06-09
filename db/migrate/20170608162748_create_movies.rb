class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster
      t.string :genre
      t.integer :runningtime
      t.integer :age

      t.timestamps
    end
  end
end
