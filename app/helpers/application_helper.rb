module ApplicationHelper

  def human_boolean(boolean)
    boolean ? 'Yes' : 'No'
end

#Then, in your view

#<%= human_boolean(boolean_youre_checking) %>



end
