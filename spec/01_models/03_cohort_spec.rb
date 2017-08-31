require 'spec_helper'

describe Cohort, type: :model do
  context "#name" do
    it { should have_valid(:name).when('Philly Cheese Stack', 'Team Slug') }
    it { should_not have_valid(:name).when(nil, '')}
  end

  context "#location" do
    it { should have_valid(:launch_site).when('Moon', 'Venus', 'HQ')}
    it { should_not have_valid(:launch_site).when(nil, '')}

    it { should have_valid(:city).when('Philadelphia', 'Boston', 'Washington')}
    it { should_not have_valid(:city).when(nil, '')}

    it { should have_valid(:state).when('PA', 'MA', 'DC') }
    it { should_not have_valid(:state).when(nil, '', "Pennsylvania")}
  end

  context "#associations" do
    it { should have_many :students }
    it { should have_many :mentors }
    it { should have_many :group_projects }
  end
end
