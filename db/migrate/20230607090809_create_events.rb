class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :venue
      t.string :host
      t.datetime :eventdate

      t.timestamps
    end
  end
end
