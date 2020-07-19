class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :calories
      t.date :date

      t.timestamps
    end
  end
end
