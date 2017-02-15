class User < ApplicationRecord
  
  has_many :role_users
  has_and_belongs_to_many :groups
  has_many :community_users
  has_many :community_contents, foreign_key: :creator_id
  has_many :marks, foreign_key: :student_id
  has_many :marks, foreign_key: :teacher_id
  has_and_belongs_to_many :message_lists
  has_many :messages, foreign_key: :sender_id
  has_many :message_users
  has_many :institution_users
  has_many :notices
  has_many :study_files

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true, inclusion: { in: ['м', 'ж'] }
  validates :user_description, length: {maximum: 250}

  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true

  def User.create_by_json(json)
    results = []
    begin
      json.each_with_index do |user_hash, i|
        u = User.find_by_email(user_hash['email'])
        if u.present?
          results << "Пользователь #{u.email} уже существует!"
        else
          passwd = User.get_passwd
          user_hash['password'] = user_hash['password_confirmation'] = passwd        
          begin
            u = User.new(user_hash)
            u.save
            if u.errors.size > 0
              results << "Студент № #{i + 1} содержит ошибки!"
            else
              results << "Студент № #{i + 1} #{u.email} зарегистрирован. Пароль: #{passwd}."
              u.activate!
            end
          rescue
            results << "Студент № #{i + 1} содержит ошибки!"
          end
        end 
      end
    rescue
      results << 'JSON файл не корректен!'
    end
    results
  end
  
  def User.get_passwd
    # Нужно в системе установить пакет expect
    mk = IO.popen('mkpasswd', 'r')
    passwd = mk.read
    mk.close
    passwd
  end
end
