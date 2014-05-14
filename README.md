# DreamCheeky Notifier

This is a gem for controlling DreamCheeky Email Notifiers from Ruby.
It's based on patkua/email-notifier, but I have added the ability to control multiple units and use ripta/color-tools to provide named colours

## Usage
```gem install dc-notifier```

or use Bundler

```
require 'dreamcheeky/notifier'

x,y = DreamCheeky::Notifier.all # This assumes that we're using at least two devices
x.colour Color::RGB::Green
y.colour Color::RGB::HotPink
```
