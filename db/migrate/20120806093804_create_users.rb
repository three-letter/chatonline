class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_id
      t.string :name

      t.timestamps
    end
    add_index :users, :github_id
  end
end
