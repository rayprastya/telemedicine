class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :accounts, null: false, foreign_key: true
      t.string :username, null: false
      t.string :nama, null: true
      t.string :email, null: true
      t.string :password_digest, null: false
      t.integer :nomor_hp, null: true
      t.string :jenis_kelamin, null: true
      t.string :role, null: true

      t.timestamps
    end
  end
end
