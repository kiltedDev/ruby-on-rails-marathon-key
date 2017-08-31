require 'rails_helper'

feature "Visitor views a list of projects at the /group_projects page" do
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
  context "by visiting /group_projects url" do

    before do
      visit "/group_projects"
    end

    scenario "displays a welcome message" do
      expect(page).to have_content("Project List")
      expect(page).to_not have_content("Welcome to Launch Academy")
    end

    scenario "displays all projects" do
      expect(page).to have_content("#{group_project_a.group_name}")
      expect(page).to have_content("#{group_project_b.group_name}")
    end

    scenario "group_project name is on page and is a link" do

      click_link "#{group_project_a.group_name}"

      expect(page).to have_content("#{group_project_a.group_name} Details")
      expect(page).to_not have_content("Project List")
    end

    scenario "'Home' is link to root page" do
      click_link "Home"

      expect(page).to have_content("Welcome to Launch Academy")
      expect(page).to_not have_content("Project List")
    end
  end
end
