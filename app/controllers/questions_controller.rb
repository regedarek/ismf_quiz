class QuestionsController < ApplicationController
  before_action :authenticate_user!

  # GET /questions or /questions.json
  def index
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @questions = @questionnaire.questions.order(position: :asc)
  end

  # GET /questions/1 or /questions/1.json
  def show
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:id])
  end

  # GET /questions/new
  def new
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.new
  end

  # GET /questions/1/edit
  def edit
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:id])
  end

  # POST /questions or /questions.json
  def create
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@questionnaire, @question], notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: question_url([@questionnaire, @question]) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:id])

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@questionnaire, @question], notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: [@questionnaire, @question] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @questionnaire = Questionnaire.friendly.find(params[:questionnaire_id])
    @question = @questionnaire.questions.friendly.find(params[:id])

    @question.destroy

    respond_to do |format|
      format.html { redirect_to questionnaire_questions_url(@questionnaire), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:name, :source, :source_url, :required, :questionnaire_id)
    end
end
