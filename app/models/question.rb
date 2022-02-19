# == Schema Information
#
# Table name: questions
#
#  id               :uuid             not null, primary key
#  name             :string           not null
#  source           :integer          not null
#  source_url       :string
#  required         :boolean          default(FALSE), not null
#  questionnaire_id :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  question_type    :integer          default("single_choice"), not null
#  position         :integer
#  slug             :string
#
class Question < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  enum source: [:gdrive_video, :gdrive_image], _suffix: true

  enum question_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }

  belongs_to :questionnaire
  has_many :answers, dependent: :destroy

  validates :source, :name, :questionnaire_id, presence: true

  def self.question_type_select
    question_types.keys.map { |k| [Question.human_enum_name(:question_type, k), k] }
  end
end
