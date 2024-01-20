class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, foreign_key: true
      t.references :journal, foreign_key: true
      t.references :feedback, foreign_key: true
      t.text "content"

      t.timestamps
    end
  end
end