module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      name: 'Личная страница',
      url: @current_user_object,
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

    if @current_role_user.present?
      if @current_role_user.is_admin?
        search_user_children = [
          { name: 'Список',
            url: users_path,
            controller: :communities, action: :index,
            icon: 'chevron-right', class: 'long'},
          { name: 'Активация',
            url: mass_activation_role_users_path,
            controller: :communities, action: :mass_activation,
            icon: 'chevron-right', class: 'long'}
        ]
        unless search_user_children.empty?
          result << {
            name: 'Пользователи',
            icon: 'users',
            children: search_user_children
          }
        end
      else
        result << {
          name: 'Пользователи',
          url: users_path,
          icon: 'users',
          controller: :users,
          action: :index
        }
      end
    end

    result << {
      name: 'Обновления', #ПРАВИТЬ
      url: users_path,
      icon: 'bell',
      controller: :users,
      action: :index
    }

    # Видно студентам и преподавателям
    if @current_role_user.present?
      if @current_role_user.is_teacher? || @current_role_user.is_student?
        result << {
          name: 'Сообщества',
          url: communities_path,
          icon: 'book',
          controller: :communities,
          action: :index
        }

      end
    end

    # Это видят админ и модератор
    if @current_role_user.present?
      if @current_role_user.is_admin? || @current_role_user.is_moderator?
        search_community_children = [
          { name: 'Контроль',
            url: communities_path,
            controller: :communities, action: :index,
            icon: 'chevron-right', class: 'long'},
          { name: 'Создание',
            url: new_community_path,
            controller: :communities, action: :new,
            icon: 'chevron-right', class: 'long'}
        ]
        unless search_community_children.empty?
          result << {
            name: 'Cообщества',
            icon: 'address-book-o',
            children: search_community_children
          }
        end

        search_discipline_children = [
          { name: 'Дисциплины',
            url: disciplines_path,
            controller: :disciplines, action: :index,
            icon: 'chevron-right', class: 'long'},
          { name: 'Алгоритмы',
            url: ranking_algorithms_path,
            controller: :ranking_algorithms, action: :index,
            icon: 'chevron-right', class: 'long'}
        ]
        unless search_discipline_children.empty?
          result << {
            name: 'Дисциплины', # как назвать раздел?
            icon: 'book',
            children: search_discipline_children
          }
        end

        search_API_children = [
          { name: 'Импорт:Студенты',
            url: load_from_json_file_students_api_path,
            controller: :students_api, action: :load_from_json_file,
            icon: 'reply', class: 'long'},
          { name: 'Импорт:Учебные группы',
            url: load_from_json_file_groups_api_path,
            controller: :groups_api, action: :load_from_json_file,
            icon: 'reply', class: 'long'},
          { name: 'Импорт:Дисциплины',
            url: load_from_json_file_disciplines_api_path,
            controller: :disciplines_api, action: :load_from_json_file,
            icon: 'reply', class: 'long'},
          { name: 'Экспорт:Студенты',
            url: load_to_json_file_students_api_path,
            controller: :students_api, action: :load_to_json_file,
            icon: 'share', class: 'long'},
        ]
        unless search_API_children.empty?
          result << {
            name: 'API-JSON',
            icon: 'wrench',
            children: search_API_children
          }
        end

      end
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
