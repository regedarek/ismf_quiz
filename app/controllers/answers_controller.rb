class AnswersController < ApplicationController
  # GET /answers or /answers.json
  def index
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answers = @question.answers
  end

  # GET /answers/1 or /answers/1.json
  def show
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  # GET /answers/new
  def new
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  # POST /answers or /answers.json
  def create
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@questionnaire, @question], notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: [@questionnaire, @question] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:name, :correct)
    end
end
