class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "はカタカナで入力してください" } do
    validates :rb_last_name
    validates :rb_first_name
  end

  validates :nickname, presence: true
  validates :birthday, presence: true
  validate :password_complexity

  private

  def password_complexity
    return if password.nil? || password.match?(/\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/)

    errors.add :password, 'は半角英数字混合で入力してください'
  end

end
