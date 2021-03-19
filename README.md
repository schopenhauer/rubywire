# RubyWire

This app provides a simple web interface for managing [WireGuard](https://www.wireguard.com) keys and configuration files. RubyWire generates configuration files, create QR codes for your mobile devices or uploads configuration files to your hosts and servers.

<img src="https://github.com/schopenhauer/rubywire/blob/main/app/assets/images/logo_transparent_alt.png">

## Features

- Generate and manage key pairs
- Generate and manage pre-shared keys
- Create and edit interface configuration
- Create and edit peer configuration
- Create and edit interface and peer associations
- Generate QR codes of your configuration files
- Upload configuration files to hosts and servers using [SFTP](https://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol)
- Visualise network nodes in a graph

## Requirements

- Ruby 3.0
- WireGuard, including wireguard-tools (i.e. `wg` command)

## How to use

- Clone the repository
- `cd` into the project and run `bundle install`
- Create database `rails db:migrate`
- Run `rails s`
- In a browser, navigate to `localhost:3000` to use

## Credits

* [WireGuard](https://www.wireguard.com)
* [Ruby](https://www.ruby-lang.org) 3.0
* [Ruby on Rails](https://rubyonrails.org) 6.1
* [Bulma](https://bulma.io) CSS framework
* [D3.js](https://d3js.org) library
