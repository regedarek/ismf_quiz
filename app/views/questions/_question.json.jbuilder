json.extract! question, :id, :name, :position, :question_type, :required, :questionnaire_id, :created_at, :updated_at
json.url question_url(question, format: :json)
