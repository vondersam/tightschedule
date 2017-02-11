class AddDateToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :duedate, :date
  end
end
