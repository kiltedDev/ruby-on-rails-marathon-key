require 'spec_helper'

describe GroupProject, type: :model do
  context "#name" do
    it { should have_valid(:group_name).when('Glitter Bomb', 'Unicorn Tea Party', 'Fairy Thrash Metal') }
    it { should_not have_valid(:group_name).when(nil, '')}
  end

  context "#project" do
    it { should have_valid(:project_name).when('Awesome Dog Tracker', 'Hot Dad Alerts')}
    it { should_not have_valid(:project_name).when(nil, '')}
  end

  context "#associations" do
    it { should belong_to :cohort }
    it { should have_many :students }
    it { should have_many :tasks }
  end
end
