module QrHelper

  DEFAULT_QR_SIZE = 640 # in pixels

  def create_qr_as_png(data, size = DEFAULT_QR_SIZE)
    RQRCode::QRCode.new(data).as_png(size: size)
  end

  def create_qr_as_base64(data)
    Base64.encode64(create_qr_as_png(data).to_s)
  end

end
