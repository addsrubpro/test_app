module ApplicationHelper  
  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end
  
  def create_useraccount_on_fail
    begin
      return yield
    rescue
      return " #{link_to('[Create user account]', new_useraccount_path(:person_id => @person_id)) }".html_safe
    end
  end
  
  def none_on_fail
    begin
      return yield
    rescue
      return "[empty]"
    end
  end
  
  def not_complete_on_fail
    begin
      return yield
    rescue
      return " #{link_to('[Data not complete]', address_path(:id => add.id)) }".html_safe
    end
  end
  
end