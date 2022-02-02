class AddCreatedByToReminders < ActiveRecord::Migration[6.1]
  def change
    add_column :reminders, :created_by, :string
  end
end
