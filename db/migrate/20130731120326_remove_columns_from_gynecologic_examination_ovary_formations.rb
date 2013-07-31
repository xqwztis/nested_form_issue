class RemoveColumnsFromGynecologicExaminationOvaryFormations < ActiveRecord::Migration
  def up
    remove_index :gynecologic_examination_ovary_formations, :name => "index_gynecologic_examination_ovary_formations_on_ovary_id"
    remove_column :gynecologic_examination_ovary_formations, :shape_id
    remove_column :gynecologic_examination_ovary_formations, :boundary_id
    remove_column :gynecologic_examination_ovary_formations, :adumbration_id
    remove_column :gynecologic_examination_ovary_formations, :content_id
    remove_column :gynecologic_examination_ovary_formations, :structure_id
    remove_column :gynecologic_examination_ovary_formations, :wall_thickness
    remove_column :gynecologic_examination_ovary_formations, :comment
  end

  def down
    add_column :gynecologic_examination_ovary_formations, :adumbration_id, :integer
    add_column :gynecologic_examination_ovary_formations, :boundary_id, :integer
    add_column :gynecologic_examination_ovary_formations, :content_id, :integer
    add_column :gynecologic_examination_ovary_formations, :shape_id, :integer
    add_column :gynecologic_examination_ovary_formations, :structure_id, :integer
    add_column :gynecologic_examination_ovary_formations, :wall_thickness, :float
    add_column :gynecologic_examination_ovary_formations, :comment, :text
  end
end
