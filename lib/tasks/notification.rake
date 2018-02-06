namespace :notification do
  desc "Acknowledge all notifications so that they can report again next time"
  task acknowledge_all: :environment do
    Notification.acknowledge_all!
  end
end
