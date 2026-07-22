class Interviewslot < ApplicationRecord
  validates :slot_academy, inclusion: { in: %w[ATCS AAST ABF ACAHA AEDT AMST AVPA-V AVPA-M AVPA-T] }
end
