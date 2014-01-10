class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :title
      t.text :description
      t.string :year
      t.string :universe

      t.timestamps
    end
  end
end
