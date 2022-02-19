# == Schema Information
#
# Table name: questionnaires
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Questionnaire < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :questions, dependent: :destroy

  validates :name, presence: true
end
