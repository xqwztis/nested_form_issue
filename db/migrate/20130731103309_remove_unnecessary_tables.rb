class RemoveUnnecessaryTables < ActiveRecord::Migration
  def up
    drop_table :gynecologic_examination_ovary_follicles
    drop_table :gynecologic_examination_ovary_sizes
    drop_table :gynecologic_examination_ovary_structures
    drop_table :gynecologic_examination_ovary_visibilities
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
