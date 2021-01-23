class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode ,null: false
      t.integer :shiping_address_id ,null: false
      t.integer :city ,null: false
      t.integer :block ,null: false
      t.string :building 
      t.string :phone_number ,null: false, unique: true
      
      t.timestamps
    end
  end
end

# t.references :order ,null: false, foreign_key: true
# こいつは後から足す