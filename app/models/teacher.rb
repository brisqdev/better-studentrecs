class Teacher < ApplicationRecord
  belongs_to :user

  validates :department, inclusion: { in: %w[math science english] }
end
