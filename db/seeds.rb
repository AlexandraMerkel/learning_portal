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
if (u2 = User.find_by_email('teacher@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Преподаватель',
    second_name: 'Без отчества', email: 'teacher@localhost',
    sex: 'ж', birthday: Date.new(1970, 11, 5))
  u2.activate!
end
if (u3 = User.find_by_email('moderator@localhost')).nil?
  u3 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Модератор',
    second_name: 'Без отчества', email: 'moderator@localhost',
    sex: 'м', birthday: Date.new(1980, 3, 11))
  u3.activate!
end
if (u4 = User.find_by_email('student@localhost')).nil?
  u4 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Cтудент',
    second_name: 'Без отчества', email: 'student@localhost',
    sex: 'м', birthday: Date.new(1995, 4, 29))
  u4.activate!
end

# Привязка ролей к пользователям
r1, r2, r3, r4 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
ru3 = RoleUser.create(role: r3, user: u3)
ru4 = RoleUser.create(role: r4, user: u4)

# Семестры
term1 = Term.create(term_name: 'осень 2016', actual: false, term_start: Date.new(2016, 9, 1), term_end: Date.new(2017, 1, 31))
term2 = Term.create(term_name: 'весна 2017', actual: true, term_start: Date.new(2017, 2, 6), term_end: Date.new(2017, 6, 30))
term3 = Term.create(term_name: 'осень 2017', actual: false, term_start: Date.new(2017, 9, 1), term_end: Date.new(2018, 1, 31))


# Рейтинговые алгоритмы
rankalg1 = RankingAlgorithm.create(algorithm_name: 'Алгоритм 1', template: 'формула 1')
rankalg2 = RankingAlgorithm.create(algorithm_name: 'Алгоритм 2', template: 'формула 2')

# Дисциплины
discipline11 = Discipline.create(discipline_name: 'Физика', discipline_type: '0', discipline_end: '1', term: term2, ranking_algorithm: rankalg1)
discipline12 = Discipline.create(discipline_name: 'Физика', discipline_type: '1', discipline_end: '1', term: term2, ranking_algorithm: rankalg1)
discipline13 = Discipline.create(discipline_name: 'Физика', discipline_type: '2', discipline_end: '1', term: term2, ranking_algorithm: rankalg1)
discipline21 = Discipline.create(discipline_name: 'Базы данных', discipline_type: '0', discipline_end: '0', term: term2, ranking_algorithm: rankalg2)
discipline22 = Discipline.create(discipline_name: 'Базы данных', discipline_type: '1', discipline_end: '0', term: term2, ranking_algorithm: rankalg2)
discipline31 = Discipline.create(discipline_name: 'Научно-исследовательская работа', discipline_type: '3', discipline_end: '2', term: term1, ranking_algorithm: rankalg2)
discipline41 = Discipline.create(discipline_name: 'Русский язык', discipline_type: '0', discipline_end: '0', term: term1, ranking_algorithm: rankalg1)

# Разделы дисциплин
dissection1 = DisciplineSection.create(section_name: 'Домашние задания по теме Механика', section_type: '1', weight: '10', min_score: '16', max_score: '25', require_type: '0', attenuation_constant: '0.5', optimal_time: Date.new(2017, 3, 30), limit_time: Date.new(2017, 4, 15), discipline: discipline11)
dissection2 = DisciplineSection.create(section_name: 'Посещаемость семинаров', section_type: '0', weight: '5', min_score: '5', max_score: '10', require_type: '0', attenuation_constant: '0.8', optimal_time: Date.new(2017, 5, 20), limit_time: Date.new(2017, 5, 20), discipline: discipline11)
dissection3 = DisciplineSection.create(section_name: 'Посещаемость лекций', section_type: '0', weight: '5', min_score: '5', max_score: '10', require_type: '1', attenuation_constant: '0.6', optimal_time: Date.new(2017, 1, 31), limit_time: Date.new(2017, 1, 31), discipline: discipline11)
dissection4 = DisciplineSection.create(section_name: 'Контрольная работа по теме Механика', section_type: '3', weight: '15', min_score: '16', max_score: '25', require_type: '0', attenuation_constant: '0.3', optimal_time: Date.new(2017, 3, 20), limit_time: Date.new(2017, 4, 5), discipline: discipline11)
dissection5 = DisciplineSection.create(section_name: 'БДЗ Создание базы данных по варианту', section_type: '1', weight: '8', min_score: '10', max_score: '15', require_type: '1', attenuation_constant: '0.6', optimal_time: Date.new(2017, 5, 10), limit_time: Date.new(2017, 5, 20), discipline: discipline21)
dissection6 = DisciplineSection.create(section_name: 'Контрольная работа по написанию запросов к БД', section_type: '3', weight: '10', min_score: '16', max_score: '25', require_type: '0', attenuation_constant: '0.7', optimal_time: Date.new(2017, 4, 15), limit_time: Date.new(2017, 4, 30), discipline: discipline21)
dissection7 = DisciplineSection.create(section_name: 'Проверочная работа по теории баз данных', section_type: '2', weight: '5', min_score: '10', max_score: '15', require_type: '0', attenuation_constant: '0.4', optimal_time: Date.new(2017, 3, 30), limit_time: Date.new(2017, 4, 15), discipline: discipline21)
dissection8 = DisciplineSection.create(section_name: 'Представление промежуточных итогов по теме', section_type: '3', weight: '7', min_score: '30', max_score: '50', require_type: '', attenuation_constant: '0.5', optimal_time: Date.new(2017, 3, 20), limit_time: Date.new(2017, 3, 30), discipline: discipline31)
dissection9 = DisciplineSection.create(section_name: 'Защита работы', section_type: '5', weight: '10', min_score: '30', max_score: '50', require_type: '0', attenuation_constant: '0.1', optimal_time: Date.new(2017, 5, 25), limit_time: Date.new(2017, 5, 25), discipline: discipline31)
dissection10 = DisciplineSection.create(section_name: 'Посещаемость лекций', section_type: '0', weight: '5', min_score: '16', max_score: '25', require_type: '1', attenuation_constant: '0.7', optimal_time: Date.new(2017, 5, 20), limit_time: Date.new(2017, 5, 20), discipline: discipline41)
dissection11 = DisciplineSection.create(section_name: 'Тест по темам лекций', section_type: '3', weight: '10', min_score: '20', max_score: '30', require_type: '0', attenuation_constant: '0.3', optimal_time: Date.new(2017, 4, 20), limit_time: Date.new(2017, 5, 15), discipline: discipline41)

#Оценки
mark1 = Mark.create(mark_value: '24', report: Date.new(2017, 4, 1), discipline_section: dissection1, student: u4, teacher: u2)
mark2 = Mark.create(mark_value: '10', report: Date.new(2017, 5, 20), discipline_section: dissection2, student: u4, teacher: u2)
mark3 = Mark.create(mark_value: '8', report: Date.new(2017, 5, 20), discipline_section: dissection3, student: u4, teacher: u2)
mark4 = Mark.create(mark_value: '20', report: Date.new(2017, 3, 20), discipline_section: dissection4, student: u4, teacher: u2)
mark5 = Mark.create(mark_value: '13', report: Date.new(2017, 3, 15), discipline_section: dissection5, student: u4, teacher: u2)
mark6 = Mark.create(mark_value: '25', report: Date.new(2017, 5, 5), discipline_section: dissection6, student: u4, teacher: u2)
mark7 = Mark.create(mark_value: '14', report: Date.new(2017, 3, 30), discipline_section: dissection7, student: u4, teacher: u2)
mark8 = Mark.create(mark_value: '45', report: Date.new(2017, 3, 25), discipline_section: dissection8, student: u4, teacher: u2)
mark9 = Mark.create(mark_value: '50', report: Date.new(2017, 5, 25), discipline_section: dissection9, student: u4, teacher: u2)
mark10 = Mark.create(mark_value: '25', report: Date.new(2017, 5, 20), discipline_section: dissection10, student: u4, teacher: u2)
mark11 = Mark.create(mark_value: '28', report: Date.new(2017, 4, 20), discipline_section: dissection11, student: u4, teacher: u2)

# Сообщества
community1 = Community.create(community_name: 'Физика (видно всем)', community_visibility: '0', archive: '0')
community2 = Community.create(community_name: 'Физика (видно модерам)', community_visibility: '1', archive: '0')
community3 = Community.create(community_name: 'Базы данных (видно всем)', community_visibility: '0', archive: '0')
community4 = Community.create(community_name: 'Базы данных (видно только владельцу)', community_visibility: '2', archive: '0')
community5 = Community.create(community_name: 'Русский язык (видно всем)', community_visibility: '0', archive: '1')
community6 = Community.create(community_name: 'Физика (видно  только владельцу)', community_visibility: '2', archive: '1')
community7 = Community.create(community_name: 'Научно-исследовательская работа (видно всем)', community_visibility: '0', archive: '1')

# Связь пользователей и сообществ
commusr11 = CommunityUser.create(link_type: '0', user: u4, community: community1 ) # студент - участник сообщества
commusr12 = CommunityUser.create(link_type: '2', user: u2, community: community1 ) # препод - владелец сообщества

commusr21 = CommunityUser.create(link_type: '1', user: u4, community: community2 ) # студент - модератор сообщества
commusr22 = CommunityUser.create(link_type: '0', user: u2, community: community2 ) # препод - участник сообщества

commusr31 = CommunityUser.create(link_type: '0', user: u4, community: community3 ) # студент - участник сообщества
commusr32 = CommunityUser.create(link_type: '1', user: u2, community: community3 ) # препод - модератор сообщества

commusr41 = CommunityUser.create(link_type: '1', user: u4, community: community4 ) # студент - модератор сообщества
commusr42 = CommunityUser.create(link_type: '2', user: u2, community: community4 ) # препод - владелец сообщества

commusr51 = CommunityUser.create(link_type: '0', user: u4, community: community5 ) # студент - участник сообщества
commusr52 = CommunityUser.create(link_type: '2', user: u2, community: community5 ) # препод - владелец сообщества

commusr61 = CommunityUser.create(link_type: '2', user: u4, community: community6 ) # студент - владелец сообщества
commusr62 = CommunityUser.create(link_type: '1', user: u2, community: community6 ) # препод - модератор сообщества

commusr71 = CommunityUser.create(link_type: '1', user: u4, community: community7 ) # студент -модератор сообщества
commusr72 = CommunityUser.create(link_type: '0', user: u2, community: community7 ) # препод - участник сообщества

# Связь дисциплин и сообществ
commdis1 = CommunityDiscipline.create(discipline: discipline11, community: community1)
commdis2 = CommunityDiscipline.create(discipline: discipline11, community: community2)
commdis3 = CommunityDiscipline.create(discipline: discipline21, community: community3)
commdis4 = CommunityDiscipline.create(discipline: discipline21, community: community4)
commdis5 = CommunityDiscipline.create(discipline: discipline41, community: community5)
commdis6 = CommunityDiscipline.create(discipline: discipline11, community: community6)
commdis7 = CommunityDiscipline.create(discipline: discipline31, community: community7)

