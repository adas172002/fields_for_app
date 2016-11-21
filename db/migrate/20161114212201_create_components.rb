class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.references :product, index: true, foreign_key: true
      t.decimal :coverage

      t.timestamps null: false
    end
  end
end
