IMGKit.configure do |config|
  config.wkhtmltoimage = 'C:/wkhtmltopdf/wkhtmltoimage.exe'
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
end