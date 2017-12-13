ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      text_node %{<iframe src="http://thermostat.encoredevlabs.com/metrics/" height="600" width="100%"></iframe>}.html_safe
    end
  end # content
end
