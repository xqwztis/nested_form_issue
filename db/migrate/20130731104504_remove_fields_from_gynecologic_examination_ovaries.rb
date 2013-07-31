class RemoveFieldsFromGynecologicExaminationOvaries < ActiveRecord::Migration
  def up
    remove_column :gynecologic_examination_ovaries, :size_id
    remove_column :gynecologic_examination_ovaries, :structure_id
    remove_column :gynecologic_examination_ovaries, :follicle_id
    remove_column :gynecologic_examination_ovaries, :visibility_id
    remove_column :gynecologic_examination_ovaries, :is_follicle_visible
  end

  def down
    add_column :gynecologic_examination_ovaries, :visibility_id, :string
    add_column :gynecologic_examination_ovaries, :follicle_id, :string
    add_column :gynecologic_examination_ovaries, :structure_id, :string
    add_column :gynecologic_examination_ovaries, :size_id, :string
    add_column :gynecologic_examination_ovaries, :is_follicle_visible, :boolean
  end
end
