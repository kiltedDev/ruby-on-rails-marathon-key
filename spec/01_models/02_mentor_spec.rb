require 'spec_helper'

describe Mentor, type: :model do
  context "#name" do
    it { should have_valid(:first_name).when('Sebastian', 'Kylee', 'Dave') }
    it { should_not have_valid(:first_name).when(nil, '')}

    it { should have_valid(:last_name).when('Kopp', 'MacMurtie') }
    it { should_not have_valid(:last_name).when(nil, '') }

    it { should have_valid(:nickname).when('Seb', 'Stinkie', 'DMac') }
  end

  context "#history" do
    it { should have_valid(:motivation).when('Pokemon', 'Parks', 'Tacos')}
    it { should_not have_valid(:motivation).when(nil, '')}

    it { should have_valid(:specialty).when('RegEx', 'CSS', 'Yodeling') }
    it { should_not have_valid(:specialty).when(nil, '')}
  end

  context "#associations" do
    it { should have_many :students }
    it { should have_many :cohorts }
  end
end
