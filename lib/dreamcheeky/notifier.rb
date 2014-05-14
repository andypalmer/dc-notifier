require 'libusb'
require 'color'

module DreamCheeky
  class Notifier
    def self.all
      @@devices ||= LIBUSB::Context.new.devices(idVendor: 0x1d34, idProduct: 4).sort.map {|device| new (device)}
    end

    def initialize(device)
      @device = device
      reset_device
    end

    def colour!(colour)
      send("%c%c%c\x00\x00\x00\x00\x05" % [colour.r, colour.g, colour.b].map {|x| x*64 })
    end

    alias :colour :colour!

    def turn_off
      colour!(Colour.new(0, 0, 0))
    end

    def send(data)
      @device.open do |handle|
        request_type = LIBUSB::REQUEST_TYPE_CLASS | LIBUSB::RECIPIENT_INTERFACE  # flags to send data to device
        # other special flags that I don't know what they do
        handle.control_transfer(:bmRequestType => request_type, :bRequest => 0x09, :wValue => 0x200, :wIndex => 0x00, :dataOut => data)
      end
    end

    # Special codes that apparently need to be sent to initialise the device.
    # The first three values of the last line also represent the RGB colours on initialisation
    def reset_device
      send "\x1f\x02\x00\x2e\x00\x00\x2b\x03"
      send "\x00\x02\x00\x2e\x00\x00\x2b\x04"
      send "\x00\x00\x00\x2e\x00\x00\x2b\x05"
    end
  end
end
