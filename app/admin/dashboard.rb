ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Organizations" do
          ul do
            Organization.last(5).map do |org|
              li link_to(org.name, admin_organization_path(org))
            end
          end
        end
      end
    end

    div class: "blank_slate_container", id: "dashboard_default_message" do
      text_node %{<iframe src="http://kibana.encoredevlabs.com/app/kibana#/dashboard/Dashboard?embed=true&_g=(refreshInterval%3A('%24%24hashKey'%3A'object%3A1938'%2Cdisplay%3A'5%20seconds'%2Cpause%3A!f%2Csection%3A1%2Cvalue%3A5000)%2Ctime%3A(from%3Anow-15m%2Cmode%3Aquick%2Cto%3Anow))" height="600" width="100%"></iframe>}.html_safe
    end
  end # content
end
