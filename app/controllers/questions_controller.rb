class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ edit show update destroy ]
	def create
		@question = Question.create(questoin_params)

    redirect_to question_path(@question), notice: 'Новый вопрос создан'
	end

  def update
    @question.update(questoin_params)

    redirect_to question_path(@question), notice: 'Сохранили вопрос'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Удалили вопрос'
  end

  def show
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  private

  def questoin_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
