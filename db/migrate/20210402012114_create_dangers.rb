class CreateDangers < ActiveRecord::Migration[6.0]
  def change
    create_table :dangers do |t|

      t.timestamps
    end
  end
end
