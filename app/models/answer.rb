# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  correct     :boolean          default(FALSE), not null
#  question_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answer < ApplicationRecord
end
