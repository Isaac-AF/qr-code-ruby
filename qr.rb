# Write your solution here!
require "rqrcode"

print "What kind of QR code would you like to generate?\n"
print "1. Open a URL\n"
print "2. Join a wifi network\n"
print "3. Send a text message\n"
print "4. Exit\n\n"

response = gets.chomp

while response != '4'
  if response == '1'
    print "What is the URL you would like to access?\n"
    url_address = gets.chomp
    qrcode = RQRCode::QRCode.new("https://#{url_address}")
  elsif response == '2'
    print "What is the name of the WiFi Network?\n"
    wifi_name = gets.chomp
    print "What is the password?\n"
    wifi_pass = gets.chomp
    qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi_name};P:#{wifi_pass};;")
  elsif response == '3'
    print "What text message would you like to send?\n"
    text_message = gets.chomp
    print "What number should the text be sent to?\n"
    text_number = gets.chomp
    qrcode = RQRCode::QRCode.new("SMSTO:#{text_number}:#{text_message}")
  end

  print "What would you like to call the PNG?\n"
  qr_name = gets.chomp

  # Use the .as_png method to create a 500 pixels by 500 pixels image
  png = qrcode.as_png({ :size => 500 })
 
  # Write the image data to a file
  IO.binwrite("#{qr_name}.png", png.to_s)

  print "What kind of QR code would you like to generate?\n"
  print "1. Open a URL\n"
  print "2. Join a wifi network\n"
  print "3. Send a text message\n"
  print "4. Exit\n\n"

  response = gets.chomp
end
