class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|

      t.timestamps
    end
  end
end
