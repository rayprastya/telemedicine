class CreateTelemedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :telemedicines do |t|

      t.timestamps
    end
  end
end
