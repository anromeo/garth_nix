class AddUniverseColumntoBooks < ActiveRecord::Migration
  def change
    add_column :books, :universe_id, :integer
  end
end
