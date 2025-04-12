# Write your solution here!
require "rqrcode"

pp "What kind of QR code would you like to generate?"
pp "1. Open a URL"
pp "2. Join a wifi network"
pp "3. Send a text message"
pp "4. Exit"

response = gets

while response != '4'
  if response == '1'
    pp "What is the URL you would like to access?"
    url_address = gets
    qrcode = RQRCode::QRCode.new(url_address)
  elsif response == '2'
    pp "What is the name of the WiFi Network?"
    wifi_name = gets
    pp "What is the password?"
    wifi_pass = gets
    qrcode = RQRCode::QRCode.new(WIFI:T:WPA;S:wifi_name;P:wifi_pass;;)
  elsif response == '3'
    pp "What text message would you like to send?"
    text_message = gets
    pp "What number should the text be sent from?"
    text_number = gets
    qrcode = RQRCode::QRCode.new(SMSTO:text_number:text_message)
  end

  pp "What would you like to call the PNG?"
  qr_name = gets

  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })

  # Write the image data to a file
  IO.binwrite(qr_name, png.to_s)

  pp "What kind of QR code would you like to generate?"
  pp "1. Open a URL"
  pp "2. Join a wifi network"
  pp "3. Send a text message"
  pp "4. Exit"

  response = gets
end
