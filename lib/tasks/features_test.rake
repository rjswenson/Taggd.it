if (Rails.env == "test" || Rails.env == "development")
  MiniTest::Rails::Testing.default_tasks << "features"
end
