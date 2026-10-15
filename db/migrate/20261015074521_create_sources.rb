class CreateSources < ActiveRecord::Migration[8.1]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.string :source_type

      t.timestamps
    end
    add_index :sources, :url, unique: true
  end
end
