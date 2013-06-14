class CreateAnswerers < ActiveRecord::Migration
  def change
    create_table :answerers do |t|
      t.references :survey
      t.references :user

      t.timestamps
    end
  end
end
