# Instalasi
## 1. Instalasi `rbenv` (Jika belum)
Project test ini menggunakan Ruby versi 2.4.0 dan menggunakan `rbenv` sebagai default utama Ruby Environment untuk memudahkan pengelolaan project-project berbasis Ruby, step instalasi :

Linux (Ubuntu) Desktop
```
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
$ ~/.rbenv/bin/rbenv init
$ ~/.rbenv/bin/rbenv install 2.4.0
```

MacOS
```
$ brew install rbenv
$ rbenv init
(follow installation)
$ rbenv install 2.4.0
```

Cek instalasi dengan cara:
```
$ rbenv --version
$ ruby --version
```

## 2. Instalasi `rbenv-vars`
`rbenv-vars` digunakan untuk pengelolaan environment variable project ruby, instalasi:
```
$ git clone https://github.com/rbenv/rbenv-vars.git $(rbenv root)/plugins/rbenv-vars
```
- Dalam project ini, environment variable terletak pada file .rbenv-vars namun telah ter-ignore melalui git. Berikut adalah isi file-nya:
```
TWITTER_API_KEY=[twitter consumer api key - dari halaman apps.twitter.com]
TWITTER_API_SECRET=[twitter consumer api secret - dari halaman apps.twitter.com]

TWITTER_ACCESS_TOKEN=[twitter access token - untuk keperluan development]
TWITTER_TOKEN_SECRET=[twitter token secret - untuk keperluan development]

POSTGRES_DATABASE_PASSWORD=[password database postgresql yang dipakai]
```

## 3. Instalasi project
Jika sudah melakukan instalasi `rbenv` atau `rvm` dengan versi ruby 2.4.0, dapat dilanjutkan dengan melakukan instalasi project:
```
$ git clone https://github.com/mkhuda/loket-event.git
$ cd loket-event
$ gem install bundler
$ bundle install
```
Jika step tersebut telah berhasil, dapat dilanjutkan dengan menambahkan file .rbenv-vars pada root folder project (seperti yang dijelaskan pada step nomor 2).

## 4. Konfigurasi & Restore Database
Project test ini menggunakan database PostgreSQL (tepatnya versi 9.5), `schema.sql` terletak di folder `db` pada project ini. Sedangkan konfigurasi pointing database terletak di folder `config/database.yml`, dimana terdiri dari 3 database:
- loket_rails (untuk production)
- loket_rails_dev (untuk keperluan development)
- loket_rails_test (untuk keperluan testing)
Untuk amannya, kita cukup membuat 3 database postgresql kosong dengan nama-nama tersebut dibawah user `postgres`. Selanjutnya melakukan step berikut ini untuk melakukan migrasi skema:
```
$ rails db:migrate
```

## 5. Uji Coba Development dan Testing
Setelah melakukan step-step diatas, kita dapat dengan langsung menjalankan project ini dengan cara:
```
$ rails s
```

Untuk testing:
```
$ rails test
```
Beberapa mekanisme testing untuk seluruh model database telah dibuat pada folder `test/models/`, command `rails test` akan mengeksekusi test model tersebut dengan merujuk dari fixtures yang telah dibuat di folder `test/fixtures`

Terima kasih.




