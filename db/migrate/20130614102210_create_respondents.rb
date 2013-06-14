class CreateRespondents < ActiveRecord::Migration
  def change
    create_table :respondents do |t|
      t.references :survey
      t.references :user

      t.timestamps
    end
  end
end
