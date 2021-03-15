class User < ApplicationRecord
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  has_secure_password
  validates :password, presence: true

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
