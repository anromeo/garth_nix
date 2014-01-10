class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :q
      t.string :a
      t.string :name
      t.string :email
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
