module ApplicationHelper
  include Pagy::Frontend

  def human_state_event_name(model, state, value)
    model.to_s.classify.constantize.send "human_#{state}_event_name", value
  end
end
