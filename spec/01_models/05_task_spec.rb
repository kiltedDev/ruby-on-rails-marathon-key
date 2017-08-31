require 'spec_helper'

describe Task, type: :model do
  context "#name" do
    it { should have_valid(:name).when('Code all the things', 'make it pretty', 'Make Coffee') }
    it { should_not have_valid(:name).when(nil, '')}
  end

  context "#{description}" do
    it {should have_valid(:description).when('Do some CSS Magic', "Pick up a lot of coffee.", "I am the very model of a modern major general.  I've information vegetable, animal and mineral.")}
  end

  context "#associations" do
    it { should belong_to :student }
    it { should belong_to :group_project }
  end
end
