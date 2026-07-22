class Transcript < ApplicationRecord
  belongs_to :applicant
  belongs_to :counselor
end
