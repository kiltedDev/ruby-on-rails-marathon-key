require 'pry'
require 'spec_helper'

describe Student, type: :model do
  context "#name" do


    it { should have_valid(:first_name).when('Vanessa', 'Kristin', 'Beth') }
    it { should_not have_valid(:first_name).when(nil, '')}

    it { should have_valid(:last_name).when('Treanor', 'Perry') }
    it { should_not have_valid(:last_name).when(nil, '') }

    it { should have_valid(:nickname).when('NapalmBeth', 'Pops') }
  end

  context "#history" do
    it { should have_valid(:motivation).when('praise', 'teaching')}
    it { should_not have_valid(:motivation).when(nil, '')}

    it { should have_valid(:backstory).when('Big Pharma', 'Yogi', 'Math Teacher') }
    it { should_not have_valid(:backstory).when(nil, '')}
  end

  context "#associations" do
    it { should belong_to :mentor}
    it { should belong_to :cohort}
    it { should belong_to :group_project}
    it { should have_many :tasks}
  end
end
