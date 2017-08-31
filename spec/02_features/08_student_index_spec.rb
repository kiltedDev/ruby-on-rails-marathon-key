require 'rails_helper'

feature "Visitor views a list of students at the /student page" do

  context "by visiting /students url" do
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
      visit "/students"
    end

    scenario "displays a welcome message" do
      expect(page).to have_content("Student Roster")
      expect(page).to_not have_content("Welcome to Launch Academy")
    end

    scenario "displays all students" do
      expect(page).to have_content("#{student_a.first_name} #{student_a.last_name }")
      expect(page).to have_content("#{student_b.first_name} #{student_b.last_name }")
    end

    scenario "'Home' is link to root page" do
      click_link "Home"

      expect(page).to have_content("Welcome to Launch Academy")
      expect(page).to_not have_content("Student Roster")
    end
  end
end
