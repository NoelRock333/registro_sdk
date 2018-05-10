class CreateAssistants < ActiveRecord::Migration[5.1]
  def change
    create_table :assistants do |t|
      t.string :reservation_code
      t.string :name
      t.string :last_name
      t.string :email
      t.string :pay_method
      t.integer :ticket_quantity
      t.date :reservation_date
      t.boolean :attended
      t.text :notes

      t.timestamps
    end
  end
end
