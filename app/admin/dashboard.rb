ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span 'Welcome to the Thermostat dashboard'
        small 'Here you can add/edit Organizations, Locations for the Organizations, Users in the Organizations, Rooms in a Location for an Organization, and add/edit Sensors for Rooms'
        small 'Just click on the links on the top of the page'
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
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
  end # content
end
