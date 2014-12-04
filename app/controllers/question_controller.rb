class QuestionController < ApplicationController
  def list
    @questions = Question.all.sort_by(&:num_votes).reverse
  end

	def submit
    if params[:body]
      question = Question.new
      question.user = current_user
      question.content = params[:body]
      question.title = params[:title]

      if question.save
        redirect_to view_question_path(:id => question.id)
      else
        flash.now[:error] = question.errors.full_messages.to_sentence
      end
    end
	end

  def view
    @question = Question.find(params[:id])
    @answers = @question.answers.sort_by(&:num_votes).reverse
  end

  def answer
    @question = Question.find(params[:id])

    if params[:body]
      answer = Answer.new
      answer.question = @question
      answer.user = current_user
      answer.content = params[:body]

      if answer.save
        redirect_to view_question_path(:id => @question.id)
      else
        flash.now[:error] = answer.errors.full_messages.to_sentence
      end
    end
  end
end
