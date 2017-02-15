module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      name: 'Личная странцица', #править
      url: users_path,
      icon: 'user',
      controller: :users,
      action: :show
    }

   result << {
      name: 'Сообщения', 
      url: message_lists_path,
      icon: 'envelope',
      controller: :messages,
      action: :index
    }

    result << {
      name: 'Пользователи',
      url: users_path,
      icon: 'users',
      controller: :users,
      action: :index
    }

    result << {
      name: 'Обновления', #править
      url: users_path,
      icon: 'bell',
      controller: :users,
      action: :index
    }

    result << {
      name: 'Сообщества', 
      url: communities_path,
      icon: 'book',
      controller: :communities,
      action: :index
    }

    # элемент списка Поиск
    search_children = [
      { name: 'JSON:Студенты', 
        url: load_from_json_file_students_api_path,
        controller: :students_api, action: :load_from_json_file,
        icon: 'reply-all', class: 'long'}, 
      { name: 'JSON:Учебные группы', 
        url: load_from_json_file_groups_api_path,
        controller: :groups_api, action: :load_from_json_file,
        icon: 'reply-all', class: 'long'}, 
      { name: 'JSON:Дисциплины', 
        url: load_from_json_file_disciplines_api_path,
        controller: :disciplines_api, action: :load_from_json_file,
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
