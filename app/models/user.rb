<<<<<<< HEAD
class User < ApplicationRecord

  #驗證
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  #關聯
  has_many :pages

end
=======
class User < ApplicationRecord
<<<<<<< HEAD
=======
  # 加密
  # require 'bcrypt'
  # has_secure_password
  #驗證
>>>>>>> feature/add_table
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  #關聯
  has_many :pages

end
>>>>>>> origin/feature/user_block_page
