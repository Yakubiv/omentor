class MessageQuery
  def initialize(search_params)
    @class_room = search_params[:class_room]
    @search_string = search_params[:search_string]
  end

  attr_reader :class_room, :search_string

  def results
    class_room.messages.where("messages.body ilike ?", "%#{search_string}%")
  end
  
end