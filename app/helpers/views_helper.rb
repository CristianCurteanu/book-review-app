module ViewsHelper
  def input_options(name, label)
    {
      placeholder: [name, @user.errors[label]].join(' '),
      class: "#{'invalid' unless @user.errors[label].blank?}"
    }
  end
end