class CreatePersons < ActiveRecord::Migration[5.2]
  def change
  	create_table :people do |t|
      t.string :first_name
      t.string :second_name
      t.string :address
      t.string :phone_number
      t.timestamps null: false
  	end
  end
end
