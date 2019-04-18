class User < ApplicationRecord
    #ユーザーモデルがセーブ前
    before_save { self.email = email.downcase }  #このselfは現在のユーザーを指します ユーザーモデルがセーブ前　整形したい　関連テーブルをアップデート
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #定数　変化しない　大文字で　#正規表現！！　型　規則を守っているか
    validates :email, presence: true, length: {maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false } #データベースに存在するか　#大文字小文字を区別するか
    has_secure_password #ひらぶんで保存しない　復号できない
    validates :password, presence: true, length: { minimum: 6 }
    #モデル同士を繋げる　　関連テーブル　リレーション！
end
