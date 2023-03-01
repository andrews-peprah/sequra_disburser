namespace :disburser do
  desc 'Sets up system'
  task setup: :environment do
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    MerchantRetriever.call
    OrderRetriever.call
  end
end
