class PopulateNicknameInUsers < ActiveRecord::Migration
  def change

    User.find_each do |user|
      if user.nickname.nil?
        user.update_attribute(:nickname, user.email)
      end
    end
  end
end
