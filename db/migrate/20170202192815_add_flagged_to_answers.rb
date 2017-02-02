class AddFlaggedToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :flagged, :boolean
  end
end
