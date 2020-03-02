class CreateJoinTableProfilesSubjects < ActiveRecord::Migration[6.0]
  def change
    create_join_table :profiles, :subjects do |t|
      t.index [:profile_id, :subject_id]
      t.index [:subject_id, :profile_id]
    end
  end
end
