class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :date
      t.string :issued_by

      t.timestamps
    end
  end
end
