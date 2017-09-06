class CreateKudos < ActiveRecord::Migration[5.1]
  def change
    create_table :kudos do |t|
      t.references :giver, foreign_key: true
      t.references :receiver, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
