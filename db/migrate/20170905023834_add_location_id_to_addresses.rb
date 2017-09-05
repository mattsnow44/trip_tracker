class AddLocationIdToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_reference :addresses, :location, foreign_key: true
  end
end
