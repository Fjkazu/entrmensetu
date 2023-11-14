class InterviewsController < ApplicationController

  INTERVIEWS_ORDER_KEY = "interviews_order"
  CURRENT_INTERVIEW_INDEX_KEY = "current_interview_index"

  def index
  end

  def start
    reset_session # セッションをリセット
  end

  def question
    show_page
  end

  def finish
  end

  private

  def show_page
    # 以前に表示したページがあれば取得、なければ初期化
    @interviews_order = session[INTERVIEWS_ORDER_KEY] || Interview.pluck(:id).shuffle
    @current_interview_index = session[CURRENT_INTERVIEW_INDEX_KEY] || 0

    if @current_interview_index < @interviews_order.length
      @current_interview_id = @interviews_order[@current_interview_index]
      @current_interview = Interview.find(@current_interview_id)
      session[CURRENT_INTERVIEW_INDEX_KEY] = (session[CURRENT_INTERVIEW_INDEX_KEY] || 0).to_i + 1
    else
      redirect_to  interviews_finish_path
    end
  end

end
