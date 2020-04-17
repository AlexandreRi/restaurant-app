class ChangeNameRatingColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :rating, :stars
  end
end
