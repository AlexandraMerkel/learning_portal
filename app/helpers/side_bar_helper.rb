module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      name: 'Пользователи',
      url: users_path,
      icon: 'users',
      controller: :users,
      action: :index
    }

    # элемент списка Поиск
    search_children = [
      { name: 'JSON:Студенты', 
        url: load_from_json_file_students_api_path,
        controller: :students_api, action: :load_from_json_file,
        icon: 'reply-all', class: 'long'}
    ]
    unless search_children.empty?
      result << {
        name: 'API',
        icon: 'wrench',
        children: search_children
      }
    end
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users'
      ctr.to_s == controller_name.to_s  
    when 'students_api'
      ctr.to_s == controller_name.to_s  
    end
  end
end
