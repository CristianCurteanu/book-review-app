module ApplicationHelper

  def create_new(object, options = {})
    return options[:success].call if object.save
    options[:failure].call
  end
end
