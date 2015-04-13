class CreateUserAppointments < ActiveRecord::Migration
  def change
    create_table :user_appointments do |t|
			t.string :first_name, null: false, limit: 20
			t.string :last_name, null: false, limit: 20
			t.string :email, null:false, limit: 50
			t.string :address, null: false, limit: 100
			t.string :phone_number, null: false
			t.string :make_year
			t.references :brand, null: false
			t.references :brand_make, null: false

      t.timestamps null: false
    end

  end


end
