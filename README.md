# FrmMercury

Send Firebase Cloud Push Messages easy and simple for Android and iOS.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'frm_mercury'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install frm_mercury

## Usage

First create an frm_mercury.rb in yours config/initializers

```ruby
require 'frm_mercury'
FrmMercury.configure do |config|
  config.api_key = "Your Api Key From Firebase console"
end
```

Then to send a message...
```ruby
FrmMercury::Sender.send("Device FCM token as String or many tokens as Array", "Some title", "Some body message", "sound.mp3 (Leave empty for default)", "Hash in case you want to send extra info (optional)")
```
