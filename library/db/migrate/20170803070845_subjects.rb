class Subjects < ActiveRecord::Migration[5.1]
  def self.up
      drop_table :subjects
      
      create_table :subjects do |t|
          t.column :name, :string
      end

      Subject.create :name => "Physics"
      Subject.create :name => "Mathematics"
      Subject.create :name => "Chemistry"
      Subject.create :name => "Psychology"
      Subject.create :name => "Geography"
  end

  def self.down
      drop_table :subjects
  end
end
