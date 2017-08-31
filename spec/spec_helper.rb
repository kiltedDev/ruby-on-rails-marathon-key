require 'shoulda/matchers'
require 'valid_attribute'
require 'pry'

require_relative 'rails_helper'

RSpec.configure do |config|
  config.fail_fast = 2

  config.before(:suite) do
    if !Task.exists?(1)
      Cohort.create(name: "Philly Cheese Stack", launch_site: "Moon", city: "Philadelphia", state: "PA")
      Cohort.create(name: "Team Slug", launch_site: "HQ", city: "Boston", state: "MA")
      Mentor.create(first_name: "Sebastian", last_name: "Kopp", nickname: "Seb", motivation: "Pokemon", specialty: "RegEx")
      Mentor.create(first_name: "Ezra", last_name: "Skolnik", nickname: "Numbers", motivation: "Numbers", specialty: "Everything")
      GroupProject.create(group_name: "Yodeling Weasels", project_name: "Mansplainer", cohort: Cohort.first)
      GroupProject.create(group_name: "Snarky Snark and the Funky Bunch", project_name: "Put a Bird on It", cohort: Cohort.find(2))
      Student.create(first_name: "Al", last_name: "Fair", nickname: "Big Al", motivation: "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}", backstory: 'Rock and Roll star', cohort: Cohort.first, mentor: Mentor.first, group_project: GroupProject.first)
      Student.create(first_name: "Kylee", last_name: "Acker", nickname: "Acre", motivation: "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}", backstory: 'Fire Fighter', cohort: Cohort.find(2), mentor: Mentor.find(2), group_project: GroupProject.find(2))
      Task.create(name: "Well, actually...", description: "The thing you don't understand is...", student: Student.first, group_project: GroupProject.first)
      Task.create(name: "Take some pictures", description: "Take photos of things so that we can put some birds on them.", student: Student.find(2), group_project: GroupProject.find(2))
      Mentorship.create(cohort: Cohort.first, mentor: Mentor.first)
      Mentorship.create(cohort: Cohort.find(2), mentor: Mentor.find(2))
    end
  end

  config.before(:each) do
    cohort_a = Cohort.first
    cohort_b = Cohort.find(2)
    student_a = Student.first
    student_b = Student.find(2)
    mentor_a = Mentor.first
    mentor_b = Mentor.find(2)
    group_project_a = GroupProject.first
    group_project_b = GroupProject.find(2)
    task_a = Task.first
    task_b = Task.find(2)
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
