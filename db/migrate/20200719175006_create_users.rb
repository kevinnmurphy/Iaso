class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email

      t.integer :height
      t.integer :weight

      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
