require 'rails_helper'

feature "Visitor views a list of cohorts at the /cohorts page" do

  context "by visiting /cohorts url" do
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
    before do
      visit "/cohorts"
    end

    scenario "displays a welcome message" do
      expect(page).to have_content("Cohort List")
      expect(page).to_not have_content("Welcome to Launch Academy")
    end

    scenario "displays all cohorts" do
      expect(page).to have_content("#{cohort_a.name}")
      expect(page).to have_content("#{cohort_b.name}")
    end

    scenario "cohort name is link to cohort page" do
      click_link "#{cohort_a.name}"

      expect(page).to have_content("#{cohort_a.name}")
      expect(page).to_not have_content("#{cohort_b.name}")

      expect(page).to have_content("Cohort Details")
      expect(page).to_not have_content("Cohort List")
    end
  end
end
