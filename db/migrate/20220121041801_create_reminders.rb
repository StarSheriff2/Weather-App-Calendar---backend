class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.string :description
      t.datetime :datetime
      t.string :city
      t.string :location_coordinates

      t.timestamps
    end
  end
end
