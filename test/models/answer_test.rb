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
require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
