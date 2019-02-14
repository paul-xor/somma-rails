class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.datetime :due_start
      t.datetime :due_end

      t.timestamps
    end
  end
end
