class ChangeTennisSchoolColumnsDefault < ActiveRecord::Migration[7.1]
  def up
    change_column_default :tennis_schools, :active, false
    change_column_default :tennis_schools, :show_clubs, false
  end

  def down
    change_column_default :tennis_schools, :active, nil
    change_column_default :tennis_schools, :show_clubs, nil
  end
end
