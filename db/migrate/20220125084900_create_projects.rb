class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :prurl
      t.string :stack
      t.string :description

      t.timestamps
    end
  end
end
