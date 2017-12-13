ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      text_node %{<iframe src="http://thermostat.encoredevlabs.com/metrics/app/kibana#/dashboard/AWBQOv_VU69E-5U4orJU?embed=true&_g=(refreshInterval%3A('%24%24hashKey'%3A'object%3A261'%2Cdisplay%3A'1%20minute'%2Cpause%3A!f%2Csection%3A2%2Cvalue%3A60000)%2Ctime%3A(from%3Anow-24h%2Cmode%3Aquick%2Cto%3Anow))" height="100%" width="100%"></iframe>}.html_safe
    end
  end # content
end
