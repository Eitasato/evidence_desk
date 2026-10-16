class CreateEvidenceLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :evidence_links do |t|
      t.references :question, null: false, foreign_key: true
      t.references :passage, null: false, foreign_key: true
      t.string :decision
      t.text :note

      t.timestamps
    end
  end
end
