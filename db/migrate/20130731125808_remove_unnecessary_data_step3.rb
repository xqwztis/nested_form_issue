class RemoveUnnecessaryDataStep3 < ActiveRecord::Migration
  def up
    drop_table :gynecologic_examination_uterine_body_visibilities
    drop_table :gynecologic_examination_uterine_body_detection_positions
    drop_table :gynecologic_examination_uterine_boundaries
    drop_table :gynecologic_examination_uterine_adumbrations
    drop_table :gynecologic_examination_uterine_shapes
    drop_table :gynecologic_examination_uterine_sizes
    drop_table :gynecologic_examination_myometric_structure_changes
    drop_table :gynecologic_examination_endometrium_echostructure_changes
    drop_table :gynecologic_examination_endometrial_boundaries
    drop_table :gynecologic_examination_endometrial_adumbrations
    drop_table :gynecologic_examination_endometrium_phases
    drop_table :gynecologic_examination_endometrium_echostructure_change_types
    drop_table :gynecologic_examination_uterine_cavity_deformations
    drop_table :gynecologic_examination_uterine_cavity_size_changes
    drop_table :gynecologic_examination_cervix_visibilities
    drop_table :gynecologic_examination_cervix_structure_changes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
