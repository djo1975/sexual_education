# db/migrate/xxxx_add_authentication_token_to_users.rb

class AddAuthenticationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token, unique: true
  end
end
