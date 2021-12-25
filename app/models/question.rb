class Question < ApplicationRecord
  enum source: [ :gdrive_video, :gdrive_image ], _suffix: true

  belongs_to :questionnaire
end
