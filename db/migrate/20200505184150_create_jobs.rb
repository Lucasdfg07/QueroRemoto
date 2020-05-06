class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :photo
      t.string :name
      t.string :company
      t.string :description
      t.date :post_date
      t.string :link
      t.string :salary

      t.timestamps
    end
  end
end
