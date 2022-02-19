# == Schema Information
#
# Table name: questionnaires
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :name, presence: true
end
