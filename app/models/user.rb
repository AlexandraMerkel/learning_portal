class User < ApplicationRecord

  has_many :role_users, inverse_of: :user
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :community_newses, class_name: "CommunityNews", join_table: :community_newses_users
  has_many :created_newses, class_name: "CommunityNews", foreign_key: "user_id"
  has_many :community_users
  has_many :community_contents, foreign_key: :creator_id
  has_many :marks, foreign_key: :student_id
  has_many :marks, foreign_key: :teacher_id
  has_and_belongs_to_many :message_lists
  has_many :messages, foreign_key: :sender_id
  has_many :message_users
  has_many :institution_users, inverse_of: :user
  has_many :notices
  has_many :study_files

  accepts_nested_attributes_for :institution_users, reject_if: proc { |a| a['institution_id'].blank? }, allow_destroy: true
  accepts_nested_attributes_for :role_users, reject_if: proc { |a| a['role_id'].blank? }, allow_destroy: true


  SEX = {
    0 => 'м',
    1 => 'ж'
  }


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true, inclusion: { in: SEX.values }
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

  def full_name
    [self.last_name, self.first_name, self.second_name].select{ |x|
      x.present? }.join(' ')
  end
  
  def User.search_users(params)
    params = params.to_s.gsub(/\s+/, '')
    @users = User.all
    @users.where("last_name ILIKE ? OR
      first_name ILIKE ? OR
      second_name ILIKE ? OR
      last_name || first_name ILIKE ? OR
      first_name || last_name ILIKE ? OR
      last_name || first_name || second_name ILIKE ? OR
      last_name || second_name || first_name ILIKE ? OR
      first_name || last_name || second_name ILIKE ? OR
      first_name || second_name || last_name ILIKE ? OR
      second_name || first_name || last_name ILIKE ? OR
      second_name || last_name || first_name ILIKE ?",
      *['%' + params + '%']*11)
  end

end
