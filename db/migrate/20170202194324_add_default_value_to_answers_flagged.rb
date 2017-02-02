class AddDefaultValueToAnswersFlagged < ActiveRecord::Migration
  def change
  	change_column_default :answers, :flagged, false
  end
end
