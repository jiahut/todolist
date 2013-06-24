class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.text :describe
      t.boolean :complete
      t.datetime :anticipated
      t.string :status

      t.timestamps
    end
  end
end
