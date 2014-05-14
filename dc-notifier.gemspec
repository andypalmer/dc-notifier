# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "dc-notifier"
  spec.version       = "0.1.0"
  spec.authors       = [ "Andy Palmer", "Pat Kua" ]
  spec.email         = [ "andy@andypalmer.com" ]
  spec.description   = "Control multiple DreamCheeky Email Notifiers from Ruby"
  spec.summary       = "Does what it says on the tin"
  spec.homepage      = "https://github.com/andypalmer/dc-notifier"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'libusb', "~> 0.2"
  spec.add_dependency 'color-tools', "~> 1.3"
end
