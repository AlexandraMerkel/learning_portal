# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Создание пользователей
if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Администратор',
    second_name: 'Без отчества', email: 'admin@localhost',
    sex: 'ж', birthday: Date.new(1978, 1, 31))
  u1.activate!
end
if (u2 = User.find_by_email('moderator@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Модератор',
    second_name: 'Без отчества', email: 'moderator@localhost',
    sex: 'м', birthday: Date.new(1980, 3, 11))
  u2.activate!
end
# Преподаватели
if (u31 = User.find_by_email('teacher1@localhost')).nil?
  u31 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Преподаватель1',
    second_name: 'Без отчества', email: 'teacher1@localhost',
    sex: 'ж', birthday: Date.new(1970, 11, 5))
  u31.activate!
end
if (u32 = User.find_by_email('teacher2@localhost')).nil?
  u32 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Преподаватель2',
    second_name: 'Без отчества', email: 'teacher2@localhost',
    sex: 'ж', birthday: Date.new(1978, 12, 4))
  u32.activate!
end
# Студенты
if (u41 = User.find_by_email('student1@localhost')).nil?
  u41 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Студент1',
    second_name: 'Без отчества', email: 'student1@localhost',
    sex: 'м', birthday: Date.new(1995, 4, 29))
  u41.activate!
end
if (u42 = User.find_by_email('student2@localhost')).nil?
  u42 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Студент2',
    second_name: 'Без отчества', email: 'student2@localhost',
    sex: 'ж', birthday: Date.new(1995, 2, 3))
  u42.activate!
end
if (u43 = User.find_by_email('student3@localhost')).nil?
  u43 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Студент3',
    second_name: 'Без отчества', email: 'student3@localhost',
    sex: 'м', birthday: Date.new(1994, 11, 30))
  u43.activate!
end

# Привязка ролей к пользователям
r1, r2, r3, r4 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1, activation_role: true)
ru2 = RoleUser.create(role: r2, user: u2, activation_role: true)
ru31 = RoleUser.create(role: r3, user: u31, activation_role: true)
ru32 = RoleUser.create(role: r3, user: u32, activation_role: false) # пользователь не активирован!
ru41 = RoleUser.create(role: r4, user: u41, activation_role: true)
ru42 = RoleUser.create(role: r4, user: u42, activation_role: true)
ru43 = RoleUser.create(role: r4, user: u43, activation_role: false) # пользователь не активирован!

# Семестры
term1 = Term.create(term_name: 'осень 2016', actual: false, term_start: Date.new(2016, 9, 1), term_end: Date.new(2017, 1, 31))
term2 = Term.create(term_name: 'весна 2017', actual: true, term_start: Date.new(2017, 2, 6), term_end: Date.new(2017, 6, 30))
term3 = Term.create(term_name: 'осень 2017', actual: false, term_start: Date.new(2017, 9, 1), term_end: Date.new(2018, 1, 31))

# Вузы
inst1 = Institution.create(institution_name: 'Национальный исследовательский ядерный университет «МИФИ»', short_institution_name: 'НИЯУ МИФИ', address: 'г. Москва, Каширское ш., 31', phone_number: '+7 (495) 788-56-99')
inst2 = Institution.create(institution_name: 'Московский авиационный институт', short_institution_name: 'МАИ', address: 'г. Москва, Волоколамское шоссе, д. 4', phone_number: '+7 (499) 158-43-33')
inst3 = Institution.create(institution_name: 'Московский технологический университет', short_institution_name: 'МИРЭА', address: 'г. Москва, р. Вернадского, 78', phone_number: '+7 (499) 215-65-65')

# Рейтинговые алгоритмы
rankalg1 = RankingAlgorithm.create(algorithm_name: 'Алгоритм 1', template: 'формула 1')
rankalg2 = RankingAlgorithm.create(algorithm_name: 'Алгоритм 2', template: 'формула 2')

# Дисциплины
discipline1 = Discipline.create(discipline_name: 'Физика', discipline_type: [0, 1, 2], discipline_end: '1', term: term2, ranking_algorithm: rankalg1)
discipline2 = Discipline.create(discipline_name: 'Базы данных', discipline_type: [0, 1], discipline_end: '0', term: term2, ranking_algorithm: rankalg2)
discipline3 = Discipline.create(discipline_name: 'Научно-исследовательская работа', discipline_type: [3], discipline_end: '2', term: term1, ranking_algorithm: rankalg2)
discipline4 = Discipline.create(discipline_name: 'Русский язык', discipline_type: [0], discipline_end: '0', term: term1, ranking_algorithm: rankalg1)

# Сообщества
community1 = Community.create(community_name: 'Физика (видно всем)', community_visibility: '0', archive: '0')
community2 = Community.create(community_name: 'Физика (видно модерам)', community_visibility: '1', archive: '0')
community3 = Community.create(community_name: 'Базы данных (видно всем)', community_visibility: '0', archive: '0')
community4 = Community.create(community_name: 'Базы данных (видно только владельцу)', community_visibility: '2', archive: '0')
community5 = Community.create(community_name: 'Русский язык (видно всем)', community_visibility: '0', archive: '1')
community6 = Community.create(community_name: 'Физика (видно  только владельцу)', community_visibility: '2', archive: '1')
community7 = Community.create(community_name: 'Научно-исследовательская работа (видно всем)', community_visibility: '0', archive: '1')

# Разделы дисциплин в сообществах
dissection1 = DisciplineSection.create(discipline_type: '1', section_name: 'Домашние задания по теме Механика', section_type: '1', weight: '10', min_score: '16', max_score: '25', require_type: '1', attenuation_constant: '0.5', optimal_time: Date.new(2017, 3, 30), limit_time: Date.new(2017, 4, 15), discipline: discipline1, community: community1)
dissection2 = DisciplineSection.create(discipline_type: '1', section_name: 'Посещаемость семинаров', section_type: '0', weight: '5', min_score: '5', max_score: '10', require_type: '1', attenuation_constant: '0.8', optimal_time: Date.new(2017, 5, 20), limit_time: Date.new(2017, 5, 20), discipline: discipline1, community: community1)
dissection3 = DisciplineSection.create(discipline_type: '0', section_name: 'Посещаемость лекций', section_type: '0', weight: '5', min_score: '5', max_score: '10', require_type: '0', attenuation_constant: '0.6', optimal_time: Date.new(2017, 1, 31), limit_time: Date.new(2017, 1, 31), discipline: discipline1, community: community1)
dissection4 = DisciplineSection.create(discipline_type: '1', section_name: 'Контрольная работа по теме Механика', section_type: '3', weight: '10', min_score: '16', max_score: '25', require_type: '1', attenuation_constant: '0.3', optimal_time: Date.new(2017, 3, 20), limit_time: Date.new(2017, 4, 5), discipline: discipline1, community: community1)
dissection5 = DisciplineSection.create(discipline_type: '0', section_name: 'БДЗ Создание базы данных по варианту', section_type: '1', weight: '8', min_score: '10', max_score: '15', require_type: '0', attenuation_constant: '0.6', optimal_time: Date.new(2017, 5, 10), limit_time: Date.new(2017, 5, 20), discipline: discipline2, community: community3)
dissection6 = DisciplineSection.create(discipline_type: '1', section_name: 'Контрольная работа по написанию запросов к БД', section_type: '3', weight: '10', min_score: '16', max_score: '25', require_type: '1', attenuation_constant: '0.7', optimal_time: Date.new(2017, 4, 15), limit_time: Date.new(2017, 4, 30), discipline: discipline2, community: community3)
dissection7 = DisciplineSection.create(discipline_type: '1', section_name: 'Проверочная работа по теории баз данных', section_type: '2', weight: '5', min_score: '10', max_score: '15', require_type: '1', attenuation_constant: '0.4', optimal_time: Date.new(2017, 3, 30), limit_time: Date.new(2017, 4, 15), discipline: discipline2, community: community3)
dissection8 = DisciplineSection.create(discipline_type: '3', section_name: 'Представление промежуточных итогов по теме', section_type: '3', weight: '7', min_score: '30', max_score: '50', require_type: '1', attenuation_constant: '0.5', optimal_time: Date.new(2017, 3, 20), limit_time: Date.new(2017, 3, 30), discipline: discipline3, community: community7)
dissection9 = DisciplineSection.create(discipline_type: '3', section_name: 'Защита работы', section_type: '5', weight: '10', min_score: '30', max_score: '50', require_type: '1', attenuation_constant: '0.1', optimal_time: Date.new(2017, 5, 25), limit_time: Date.new(2017, 5, 25), discipline: discipline3, community: community7)
dissection10 = DisciplineSection.create(discipline_type: '0', section_name: 'Посещаемость лекций', section_type: '0', weight: '5', min_score: '16', max_score: '25', require_type: '0', attenuation_constant: '0.7', optimal_time: Date.new(2017, 5, 20), limit_time: Date.new(2017, 5, 20), discipline: discipline4, community: community5)
dissection11 = DisciplineSection.create(discipline_type: '0', section_name: 'Тест по темам лекций', section_type: '3', weight: '10', min_score: '20', max_score: '30', require_type: '1', attenuation_constant: '0.3', optimal_time: Date.new(2017, 4, 20), limit_time: Date.new(2017, 5, 15), discipline: discipline4, community: community5)

#Оценки
# студенту 1 (средний)
mark1_1 = Mark.create(mark_value: '22', report: Date.new(2017, 4, 1), discipline_section: dissection1, student: u41, teacher: u31)
mark1_2 = Mark.create(mark_value: '10', report: Date.new(2017, 5, 20), discipline_section: dissection2, student: u41, teacher: u31)
mark1_3 = Mark.create(mark_value: '8', report: Date.new(2017, 5, 20), discipline_section: dissection3, student: u41, teacher: u31)
mark1_4 = Mark.create(mark_value: '20', report: Date.new(2017, 3, 20), discipline_section: dissection4, student: u41, teacher: u31)
mark1_5 = Mark.create(mark_value: '12', report: Date.new(2017, 3, 15), discipline_section: dissection5, student: u41, teacher: u31)
mark1_6 = Mark.create(mark_value: '20', report: Date.new(2017, 5, 5), discipline_section: dissection6, student: u41, teacher: u31)
mark1_7 = Mark.create(mark_value: '13', report: Date.new(2017, 3, 30), discipline_section: dissection7, student: u41, teacher: u31)
mark1_8 = Mark.create(mark_value: '40', report: Date.new(2017, 3, 25), discipline_section: dissection8, student: u41, teacher: u32)
mark1_9 = Mark.create(mark_value: '48', report: Date.new(2017, 5, 25), discipline_section: dissection9, student: u41, teacher: u32)
mark1_10 = Mark.create(mark_value: '20', report: Date.new(2017, 5, 20), discipline_section: dissection10, student: u41, teacher: u32)
mark1_11 = Mark.create(mark_value: '26', report: Date.new(2017, 4, 20), discipline_section: dissection11, student: u41, teacher: u32)
# студенту 2 (прогульщик)
mark2_1 = Mark.create(mark_value: '18', report: Date.new(2017, 4, 5), discipline_section: dissection1, student: u42, teacher: u31)
mark2_2 = Mark.create(mark_value: '5', report: Date.new(2017, 5, 21), discipline_section: dissection2, student: u42, teacher: u31)
#mark3 = Mark.create(mark_value: '0', report: Date.new(2017, 5, 20), discipline_section: dissection3, student: u41, teacher: u31)
mark2_4 = Mark.create(mark_value: '16', report: Date.new(2017, 3, 21), discipline_section: dissection4, student: u42, teacher: u31)
mark2_5 = Mark.create(mark_value: '10', report: Date.new(2017, 3, 17), discipline_section: dissection5, student: u42, teacher: u31)
mark2_6 = Mark.create(mark_value: '16', report: Date.new(2017, 5, 10), discipline_section: dissection6, student: u42, teacher: u31)
mark2_7 = Mark.create(mark_value: '10', report: Date.new(2017, 3, 31), discipline_section: dissection7, student: u42, teacher: u31)
mark2_8 = Mark.create(mark_value: '30', report: Date.new(2017, 3, 30), discipline_section: dissection8, student: u42, teacher: u32)
mark2_9 = Mark.create(mark_value: '35', report: Date.new(2017, 5, 27), discipline_section: dissection9, student: u42, teacher: u32)
mark2_10 = Mark.create(mark_value: '16', report: Date.new(2017, 5, 21), discipline_section: dissection10, student: u42, teacher: u32)
mark2_11 = Mark.create(mark_value: '21', report: Date.new(2017, 4, 23), discipline_section: dissection11, student: u42, teacher: u32)
# студенту 3 (отличник)
mark3_1 = Mark.create(mark_value: '25', report: Date.new(2017, 4, 1), discipline_section: dissection1, student: u43, teacher: u31)
mark3_2 = Mark.create(mark_value: '10', report: Date.new(2017, 5, 20), discipline_section: dissection2, student: u43, teacher: u31)
mark3_3 = Mark.create(mark_value: '10', report: Date.new(2017, 5, 20), discipline_section: dissection3, student: u43, teacher: u31)
mark3_4 = Mark.create(mark_value: '23', report: Date.new(2017, 3, 20), discipline_section: dissection4, student: u43, teacher: u31)
mark3_5 = Mark.create(mark_value: '15', report: Date.new(2017, 3, 15), discipline_section: dissection5, student: u43, teacher: u31)
mark3_6 = Mark.create(mark_value: '24', report: Date.new(2017, 5, 5), discipline_section: dissection6, student: u43, teacher: u31)
mark3_7 = Mark.create(mark_value: '15', report: Date.new(2017, 3, 30), discipline_section: dissection7, student: u43, teacher: u31)
mark3_8 = Mark.create(mark_value: '50', report: Date.new(2017, 3, 25), discipline_section: dissection8, student: u43, teacher: u32)
mark3_9 = Mark.create(mark_value: '45', report: Date.new(2017, 5, 25), discipline_section: dissection9, student: u43, teacher: u32)
mark3_10 = Mark.create(mark_value: '25', report: Date.new(2017, 5, 20), discipline_section: dissection10, student: u43, teacher: u32)
mark3_11 = Mark.create(mark_value: '29', report: Date.new(2017, 4, 20), discipline_section: dissection11, student: u43, teacher: u32)

# Связь пользователей и сообществ
commusr1_1 = CommunityUser.create(link_type: '0', user: u41, community: community1 ) # студенты 1,2,3 - участники сообщества
commusr1_2 = CommunityUser.create(link_type: '0', user: u42, community: community1 )
commusr1_3 = CommunityUser.create(link_type: '0', user: u43, community: community1 )
commusr1_4 = CommunityUser.create(link_type: '2', user: u31, community: community1 ) # преподы 1,2 - владельцы сообщества
commusr1_5 = CommunityUser.create(link_type: '2', user: u32, community: community1 )

commusr2_1 = CommunityUser.create(link_type: '0', user: u41, community: community2 ) # студенты 1,2 - участники сообщества
commusr2_2 = CommunityUser.create(link_type: '0', user: u42, community: community2 )
commusr2_3 = CommunityUser.create(link_type: '1', user: u43, community: community2 ) # студент 3 - модератор сообщества
commusr2_4 = CommunityUser.create(link_type: '0', user: u31, community: community2 ) # препод 1 - участник сообщества
commusr2_5 = CommunityUser.create(link_type: '2', user: u32, community: community2 ) # препод 2 - владелец сообщества

commusr3_1 = CommunityUser.create(link_type: '0', user: u41, community: community3 ) # студенты 1,2,3 - участники сообщества
commusr3_2 = CommunityUser.create(link_type: '0', user: u42, community: community3 )
commusr3_3 = CommunityUser.create(link_type: '0', user: u43, community: community3 )
commusr3_4 = CommunityUser.create(link_type: '2', user: u31, community: community3 ) # препод 1 - владелец сообщества
commusr3_5 = CommunityUser.create(link_type: '1', user: u32, community: community3 ) # препод 2 - модератор сообщества

commusr4_1 = CommunityUser.create(link_type: '1', user: u41, community: community4 ) # студент 1 - модератор сообщества
commusr4_2 = CommunityUser.create(link_type: '0', user: u42, community: community4 ) # студенты 2, 3 - участники сообщества
commusr4_3 = CommunityUser.create(link_type: '0', user: u43, community: community4 )
commusr4_4 = CommunityUser.create(link_type: '2', user: u31, community: community4 ) # препод 1 - владелец сообщества
commusr4_4 = CommunityUser.create(link_type: '1', user: u32, community: community4 ) # препод 2 - модератор сообщества

commusr5_1 = CommunityUser.create(link_type: '0', user: u41, community: community5 ) # студенты 1,2,3 - участники сообщества
commusr5_2 = CommunityUser.create(link_type: '0', user: u42, community: community5 )
commusr5_3 = CommunityUser.create(link_type: '0', user: u43, community: community5 )
commusr5_4 = CommunityUser.create(link_type: '2', user: u31, community: community5 ) # преподы 1,2 - владельцы сообщества
commusr5_4 = CommunityUser.create(link_type: '2', user: u32, community: community5 )

commusr6_1 = CommunityUser.create(link_type: '1', user: u41, community: community6 ) # студент 1 - модератор сообщества
commusr6_2 = CommunityUser.create(link_type: '0', user: u42, community: community6 ) # студент 2 - участник сообщества
commusr6_3 = CommunityUser.create(link_type: '2', user: u43, community: community6 ) # студент 1 - владелец сообщества
commusr6_4 = CommunityUser.create(link_type: '1', user: u31, community: community6 ) # препод 1 - модератор сообщества
commusr6_5 = CommunityUser.create(link_type: '0', user: u32, community: community6 ) # препод 2 - участник сообщества

commusr7_1 = CommunityUser.create(link_type: '1', user: u41, community: community7 ) # студент 1 -модератор сообщества
commusr7_2 = CommunityUser.create(link_type: '0', user: u42, community: community7 ) # студенты 2,3 - участники сообщества
commusr7_3 = CommunityUser.create(link_type: '0', user: u43, community: community7 )
commusr7_4 = CommunityUser.create(link_type: '0', user: u31, community: community7 ) # препод 1 - участник сообщества
commusr7_5 = CommunityUser.create(link_type: '2', user: u32, community: community7 ) # препод 2 - владелец сообщества

# Связь дисциплин и сообществ
commdis1 = CommunityDiscipline.create(discipline: discipline1, community: community1)
commdis2 = CommunityDiscipline.create(discipline: discipline1, community: community2)
commdis3 = CommunityDiscipline.create(discipline: discipline2, community: community3)
commdis4 = CommunityDiscipline.create(discipline: discipline2, community: community4)
commdis5 = CommunityDiscipline.create(discipline: discipline4, community: community5)
commdis6 = CommunityDiscipline.create(discipline: discipline1, community: community6)
commdis7 = CommunityDiscipline.create(discipline: discipline3, community: community7)