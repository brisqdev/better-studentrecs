class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :counselor
  belongs_to :math_teacher, class_name: "Teacher"
  belongs_to :science_teacher, class_name: "Teacher"
  belongs_to :english_teacher, class_name: "Teacher"
end
