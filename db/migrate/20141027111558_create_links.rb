class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :original_link
      t.string  :shortened_link
      t.integer :visitor_counter, default: 0

      t.timestamps
    end
  end
end

