class AlterUserForMoreLongOtpBackupCodes < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :otp_backup_codes, :text
  end

  def down
    change_column :users, :otp_backup_codes, :string
  end
end
