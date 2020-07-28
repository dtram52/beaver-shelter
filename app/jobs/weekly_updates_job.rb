class WeeklyUpdatesJob
  @queue = :weekly_updates_mailer

  def self.perform
    users = User.where(email_notifications: true)
    for user in users
      StatusUpdateMailer.with(user: user).weekly_update_email.deliver_now
    end
  end

end
