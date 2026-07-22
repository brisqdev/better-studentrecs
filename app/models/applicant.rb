class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :counselor
  belongs_to :math_teacher, class_name: "Teacher"
  belongs_to :science_teacher, class_name: "Teacher"
  belongs_to :english_teacher, class_name: "Teacher"

  validates :academy_of_application, inclusion: { in: %w[ATCS AAST ABF ACAHA AEDT AMST AVPA-V AVPA-M AVPA-T] }
  validates :application_status, inclusion: { in: %w[application_pending test_assigned test_completed interview_assigned interview_rejected interview_completed application_waitlisted application_accepted application_voided] }
end
