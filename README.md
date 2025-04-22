# ActiveStorage Download Logger

[![Rails Engine](https://img.shields.io/badge/Rails-Engine-blue.svg)](https://guides.rubyonrails.org/engines.html)

A mountable Rails engine that logs every download of ActiveStorage files — capturing user, IP address, origin controller, and record context.

---

## ✨ Features

- 📅 Logs all ActiveStorage file downloads
- 👤 Tracks user (if authenticated)
- 🌐 Captures IP address, controller context, and associated record
- 📊 Easily query download history
- 🔒 Works seamlessly with Devise or other auth systems
- 📦 Rails 6 and 7+ compatible

---

## 🚀 Installation

Add this gem to your application's Gemfile:

```ruby
gem 'active_storage_download_logger', github: 'tajccil/active_storage_download_logger'
```

Then run:

```bash
bundle install
```

---

## ⚙️ Setup

### 1. Mount the Engine

In your app's `config/routes.rb`:

```ruby
mount ActiveStorageDownloadLogger::Engine => "/downloads"
```

---

### 2. Install Migrations

```bash
bin/rails railties:install:migrations
bin/rails db:migrate
```

---

### 3. Replace Your Download Links

Instead of using:

```erb
<%= link_to rails_blob_path(file, disposition: "attachment") %>
```

Use this:

```erb
<%= link_to ActiveStorageDownloadLogger::Engine.routes.url_helpers.download_path(
              signed_blob_id: file.blob.signed_id,
              source: params[:controller]
            ) do %>
  Download
<% end %>
```

---

## 📄 What Gets Logged

| Field             | Description                                  |
|------------------|----------------------------------------------|
| `blob_id`         | Which file was downloaded                    |
| `user_id`         | Who downloaded it (if logged in)             |
| `ip_address`      | The user's IP address                        |
| `controller_name` | The page/context it was downloaded from      |
| `record_type/id`  | Associated model the file was attached to    |
| `created_at`      | Timestamp of the download                    |

---

## 📂 Model: `DownloadLog`

Accessible via:

```ruby
ActiveStorageDownloadLogger::DownloadLog
```

Query examples:

```ruby
ActiveStorageDownloadLogger::DownloadLog.last
ActiveStorageDownloadLogger::DownloadLog.where(user_id: current_user.id)
```

---

## 📌 Notes

- Works with Devise or any `current_user` setup.
- Does not log duplicate downloads from the same user/blob/context within a short interval (customizable).
- Supports polymorphic file attachments.

---

## 🛡 License

MIT © [Shaik Tajuddinsha](https://github.com/tajccil)

---

## ❓ Need Help?

Feel free to [open an issue](https://github.com/tajccil/active_storage_download_logger/issues) or drop a star ⭐ if this helped!

