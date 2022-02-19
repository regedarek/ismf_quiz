# == Schema Information
#
# Table name: questions
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  source           :integer          not null
#  source_url       :string
#  required         :boolean          default(FALSE), not null
#  questionnaire_id :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
