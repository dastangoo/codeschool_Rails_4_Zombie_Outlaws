class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :age
      t.string :desc

      t.timestamps
    end
  end
end
