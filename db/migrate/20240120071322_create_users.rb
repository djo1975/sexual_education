class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string "nickname"
      t.string "first_name"
      t.string "last_name"
      t.string "gender"
      t.integer "age"
      t.string "country"
      t.string "occupation"
      t.string "email", default: "", null: false

      t.timestamps
    end
  end
end