# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Администратор', 
    second_name: 'Без отчества', email: 'admin@localhost',
    sex: 'ж', birthday: Date.today())
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Пользователь', 
    second_name: 'Без отчества', email: 'user@localhost',
    sex: 'ж', birthday: Date.today())
  u2.activate!
end
if (u3 = User.find_by_email('moderator@localhost')).nil?
  u3 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Модератор', 
    second_name: 'Без отчества', email: 'moderator@localhost',
    sex: 'м', birthday: Date.today())
  u3.activate!
end
if (u4 = User.find_by_email('student@localhost')).nil?
  u4 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    last_name: 'Тестовый', first_name: 'Cтудент', 
    second_name: 'Без отчества', email: 'student@localhost',
    sex: 'м', birthday: Date.today())
  u4.activate!
end

r1, r2, r3, r4 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)
ru3 = RoleUser.create(role: r3, user: u3)
ru4 = RoleUser.create(role: r4, user: u4)