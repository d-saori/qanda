class QuestionsController < ApplicationController
  # アクションが実行する前に指定したメソッド(今回はset_questionの事)を実行する
  # []内に上記の指定を実行するメソッドを書く
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    # @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: "Success!"
    else
      flash[:alert] = "Save error!"
      render :new
    end
  end

  def edit
    # @question = Question.find(params[:id])
  end

  def update
    # @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: "Success!"
    else
      flash[:alert] = "Save error!"
      render :edit
    end
  end

  def destroy
    # @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: "Success!"
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
end
