class ChangeTasksNameNotNull < ActiveRecord::Migration[5.2]
  def change
    #change_column_nullは既存テーブルの既存カラムのNOTNULL制約をつけたり外したりする
    change_column_null :tasks, :name, false
  end
end
