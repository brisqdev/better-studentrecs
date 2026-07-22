class Transcript < ApplicationRecord
  belongs_to :counselor

  has_one_attached :transcript_document
end
