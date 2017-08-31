require 'rails_helper'

feature "Visitor views a list of cohorts at the /cohorts page" do
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
  context "by visiting /cohorts/:id url" do

    before do
      visit "/cohorts/#{cohort_a.id}"
    end

    scenario "displays correct cohort" do
      expect(page).to have_content("#{cohort_a.name}")
      expect(page).to_not have_content("#{cohort_b.name}")
    end

    scenario "displays students in cohort" do

      expect(page).to have_content("#{student_a.first_name}")
      expect(page).to_not have_content("#{student_b.first_name}")
    end

    scenario "displays mentors in cohort" do

      expect(page).to have_content("#{mentor_a.first_name}")
      expect(page).to_not have_content("#{mentor_b.first_name}")
    end

    scenario "displays projects in cohort" do

      expect(page).to have_content("#{group_project_a.group_name}")
      expect(page).to_not have_content("#{group_project_b.group_name}")
    end

    scenario "group_project name is on page and is a link" do
      expect(page).to have_content("#{group_project_a.group_name}")
      expect(page).to_not have_content("#{group_project_b.group_name}")

      click_link "#{group_project_a.group_name}"

      expect(page).to have_content("#{group_project_a.group_name} Details")
      expect(page).to_not have_content("#{cohort_a.name} Details")
    end
  end
end
