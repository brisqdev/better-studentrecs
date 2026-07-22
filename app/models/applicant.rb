class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :counselor
  belongs_to :math_teacher, class_name: "Teacher"
  belongs_to :science_teacher, class_name: "Teacher"
  belongs_to :english_teacher, class_name: "Teacher"
  belongs_to :test_slot, class_name: "Testslot"
  belongs_to :interview_slot, class_name: "Interviewslot"
  belongs_to :recommendation
  belongs_to :transcript

  validates :academy_of_application, inclusion: { in: %w[ATCS AAST ABF ACAHA AEDT AMST AVPA-V AVPA-M AVPA-T] }
  validates :application_status, inclusion: { in: %w[application_pending application_voided test_assigned test_completed interview_assigned interview_rejected interview_completed application_waitlisted application_accepted application_attending application_nonattending] }
end
