class RemoveUnnecessaryDataStep4 < ActiveRecord::Migration
  def up
    remove_column :gynecologic_examinations, :uterine_body_visibility_id
    remove_column :gynecologic_examinations, :uterine_body_detection_position_id
    remove_column :gynecologic_examinations, :uterine_boundary_id
    remove_column :gynecologic_examinations, :uterine_adumbration_id
    remove_column :gynecologic_examinations, :uterine_shape_id
    remove_column :gynecologic_examinations, :uterine_size_id
    remove_column :gynecologic_examinations, :uterine_width
    remove_column :gynecologic_examinations, :uterine_anteroposterior
    remove_column :gynecologic_examinations, :myometric_structure_change_id
    remove_column :gynecologic_examinations, :myometrium_anterior_wall_thickness
    remove_column :gynecologic_examinations, :myometrium_posterior_wall_thickness
    remove_column :gynecologic_examinations, :endometrium_echostructure_change_id
    remove_column :gynecologic_examinations, :endometrial_thickness
    remove_column :gynecologic_examinations, :endometrial_boundary_id
    remove_column :gynecologic_examinations, :endometrial_adumbration_id
    remove_column :gynecologic_examinations, :endometrium_phase_id
    remove_column :gynecologic_examinations, :endometrium_echostructure_change_type_id
    remove_column :gynecologic_examinations, :uterine_cavity_deformation_id
    remove_column :gynecologic_examinations, :uterine_cavity_size_change_id
    remove_column :gynecologic_examinations, :uterine_cavity_size
    remove_column :gynecologic_examinations, :is_uterine_cavity_node_present
    remove_column :gynecologic_examinations, :cervix_visibility_id
    remove_column :gynecologic_examinations, :cervix_size
    remove_column :gynecologic_examinations, :is_cervix_of_normal_size
    remove_column :gynecologic_examinations, :cervix_structure_change_id
    remove_column :gynecologic_examinations, :endocervix_cyst_min_size
    remove_column :gynecologic_examinations, :endocervix_cyst_max_size
    remove_column :gynecologic_examinations, :is_endocervix_cyst_multiple
  end

  def down
  end
end
