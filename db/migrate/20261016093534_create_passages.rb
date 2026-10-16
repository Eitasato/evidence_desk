class CreatePassages < ActiveRecord::Migration[8.1]
  def change
    create_table :passages do |t|
      t.references :source, null: false, foreign_key: true
      t.text :body
      t.string :heading_path
      t.integer :page_index
      t.integer :paragraph_index

      t.timestamps
    end
  end
end
