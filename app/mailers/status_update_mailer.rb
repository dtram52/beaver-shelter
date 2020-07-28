class StatusUpdateMailer < ApplicationMailer
  default from: 'admin@beavershelter.team'

  def weekly_update_email
    @user = params[:user]
    @status_updates = StatusUpdate.where('created_at >= ?', 1.week.ago)
    unless @status_updates.length == 0
      mail(to: user.email, subject: 'Weekly BeaverShelter Updates')
    end
  end

end
