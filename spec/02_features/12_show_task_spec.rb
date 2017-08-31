require 'rails_helper'

feature "Visitor views a list of projects at the /group_projects/:id page" do
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
  context "by visiting /tasks/:id url" do

    before do
      visit "group_projects/#{group_project_a.id}/tasks/#{task_a.id}"
    end

    scenario "names the correct page" do
      expect(page).to have_content("#{task_a.name} Details")
      expect(page).to_not have_content("Project Details")
    end

    scenario "displays student working on task" do

      expect(page).to have_content("#{student_a.first_name}")
      expect(page).to_not have_content("#{student_b.first_name}")
    end

    scenario "displays description of task" do

      expect(page).to have_content("#{task_a.description}")
      expect(page).to_not have_content("#{task_b.description}")
    end

  end
end
