class AddDetailsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :minicrewan_title, :string
    add_column :messages, :minicrewan_message, :string
  end
end
