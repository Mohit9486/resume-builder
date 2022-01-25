class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :position
      t.date :start
      t.date :end
      t.string :description

      t.timestamps
    end
  end
end
