class AddEmailAddressToComments < ActiveRecord::Migration
  def change
    add_column :comments, :email_address, :string
  end
end
