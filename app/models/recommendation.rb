class Recommendation < ApplicationRecord
  belongs_to :applicant
  belongs_to :teacher

  has_one_attached :transcript_document
end
