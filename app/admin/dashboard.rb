ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Recent Users" do
          ul do
            User.all.map do |user|
              para "#{user.email} created at #{user.created_at}"
            end
          end
        end
      end
    end
  end # content
end
