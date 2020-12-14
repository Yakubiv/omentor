class ChatQuery

  def initialize(params)
    @search_string = params[:search_string]
    @type = params[:type]
    @current_tutor_profile = params[:current_tutor_profile]
  end

  def results
  end

end       