class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :no_hp
      t.string :gender
      t.string :experience
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
