class RemoveUnnecessaryDataStep2 < ActiveRecord::Migration
  def up
    drop_table :gynecologic_examination_ovary_formation_adumbrations
    drop_table :gynecologic_examination_ovary_formation_boundaries
    drop_table :gynecologic_examination_ovary_formation_contents
    drop_table :gynecologic_examination_ovary_formation_shapes
    drop_table :gynecologic_examination_ovary_formation_structures
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
