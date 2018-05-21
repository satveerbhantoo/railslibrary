
ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        link_to 'Button text', admin_notify_users_path, method: :post
      end
    end
  end
  
  controller do
    require 'sendgrid-ruby'
    include SendGrid
    def notify_users
      puts "### >>Notifying users"
      data = JSON.parse('{
        "personalizations": [
          {
            "to": [
              {
                "email": "satveer.bhantoo@sc-mauritius.com"
              }
            ],
            "subject": "Sending with SendGrid is Fun"
          }
        ],
        "from": {
          "email": "test@example.com"
        },
        "content": [
          {
            "type": "text/plain",
            "value": "and easy to do anywhere, even with Ruby"
          }
        ]
      }')

      puts ENV['SENDGRID_API_KEY']

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._("send").post(request_body: data)
      puts response.status_code
      puts response.body
      puts response.parsed_body
      puts response.headers
      puts "### >> End Notifying users"
    end
  end
end
