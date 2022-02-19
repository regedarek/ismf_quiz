# == Schema Information
#
# Table name: answers
#
#  id          :uuid             not null, primary key
#  name        :string           not null
#  correct     :boolean          default(FALSE), not null
#  question_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answer < ApplicationRecord
  belongs_to :question

  validates :name, presence: true
  validates :name, uniqueness: { scope: :question_id }

  validate :only_answer_correct_in_single_choice

  def only_answer_correct_in_single_choice
    if correct && question.single_choice?
      if question.answers.except(self).any? {|answer| answer.correct? }
        errors.add(:correct, "może być tylko jedna poprawna odpowiedź")
      end
    end
  end
end
