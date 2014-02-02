class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :publisher
      t.string :published_date
      t.string :coauthors

      t.timestamps
    end
  end
end
