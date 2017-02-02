class AddDefaultValueToCommentsFlagged < ActiveRecord::Migration
  def change
  	change_column_default :comments, :flagged, false
  end
end
