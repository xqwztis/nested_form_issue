class RemoveFieldsFromGynecologicExaminationOvaryFormationChambers < ActiveRecord::Migration
  def up
    remove_column :gynecologic_examination_ovary_formation_chambers, :suspension_id
    remove_column :gynecologic_examination_ovary_formation_chambers, :inner_surface_id
    remove_column :gynecologic_examination_ovary_formation_chambers, :comment
  end

  def down
    add_column :gynecologic_examination_ovary_formation_chambers, :comment, :string
    add_column :gynecologic_examination_ovary_formation_chambers, :inner_surface_id, :string
    add_column :gynecologic_examination_ovary_formation_chambers, :suspension_id, :string
  end
end
