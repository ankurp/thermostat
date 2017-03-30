ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      text_node %{<iframe src="http://kibana.encoredevlabs.com/app/kibana#/dashboard/Dashboard?embed=true&_g=(refreshInterval%3A('%24%24hashKey'%3A'object%3A1045'%2Cdisplay%3A'1%20minute'%2Cpause%3A!f%2Csection%3A2%2Cvalue%3A60000)%2Ctime%3A(from%3Anow-24h%2Cmode%3Aquick%2Cto%3Anow))" height="600" width="100%"></iframe>}.html_safe
      text_node %{<iframe src="http://kibana.encoredevlabs.com/app/kibana#/dashboard/Notification-Count?embed=true&_g=(refreshInterval%3A('%24%24hashKey'%3A'object%3A1298'%2Cdisplay%3A'1%20hour'%2Cpause%3A!f%2Csection%3A3%2Cvalue%3A3600000)%2Ctime%3A(from%3A'2017-03-07T12%3A51%3A19.805Z'%2Cmode%3Aabsolute%2Cto%3A'2017-04-01T20%3A57%3A14.660Z'))" height="600" width="100%"></iframe>}.html_safe
    end
  end # content
end
