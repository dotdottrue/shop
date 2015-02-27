<h1>Webentwicklung II Projekt</h1>
Das Projekt wurde in ```Ruby 2.2.0``` und ```Rails 4.2.0```entwickelt.

Das Projekt beinhaltet einen funktionstüchtigen Webshop, in welchem man sich als Benutzer registrieren kann und auch Einkäufe tätigen kann.

<h3>Starten der Applikation</h3>

Um das Repository zu verwenden sollte man im Schritt 1 dieses Klonen.<br />
Folgender Befehl ist dafür notwendig:<br /><br />
``` git clone https://github.com/dotdottrue/shop.git ```
<br /><br />
Der nächste Schritt ist das ausführen des Bundlers um die Gems zu installieren:<br /><br />
```bundle install```
<br />
Um eine reibungslose Verwendung von <b>Paperclip</b> sowie <b>PG(PostgreSQL)</b> zu gewährleisten wird empfohlen bzw.<br /> sollte noch folgendes per Commandline installiert werden.<br />
Für <b>Paperclip</b> sollten folgende Befehle ausgeführt werden:<br />
<b>Mac: </b><br />
```brew install imagemagick```
<br /><b>Linux</b><br />
```sudo apt-get install imagemagick```
<br /><b>Windows</b><br />
Falls Windows verwendet wird muss Imagemagick manuell installiert werden.<br />
Den Download finden Sie unter folgendem Link: [DownloadLink](http://gnuwin32.sourceforge.net/packages/file.htm)
<br /> <br />
Bei Problemen mit <strong>PostgreSQL</strong><br />
<strong>Mac: </strong><br />
```brew update``` 
<br />
```brew install postgresql```
<br /><strong>Linux</strong><br />
```sudo apt-get install libpq-dev```

Nachdem der Bundler durchgelaufen ist und oben genannte Befehle ausgeführt wurden (da notwendig oder durch Fehler)
kann die Datenbank migriert werden.

```rake db:migrate```

Nach erfolgreichem Migrieren der Datenbank kann diese mit Testdaten/Seeds befüllt werden.<br />
```rake db:seed```<br />

Ab diesem Punkt ist die ist der Webshop einsatzbereit und voll funktionsfähig.

Es wird ein Adminbenutzer bei den Seeds mit angelegt. Dieser kann Produkte anlegen, und andere Daten einsehen, ändern etc.

Mail:
```admin@dotdottrue.com```<br />
Passwort: 
```admin678```<br />

Ein Standardbenutzer wird nicht mit angelegt, da dieser eigenständig Angelegt werden kann und die Funktionen mit diesem durchlaufen werden können.

Um den Shop leichtgewichtig zu halten wurden keine extravagenten Zahlungsmethoden integriert.
Desweiteren wurde eine spezielle Rollenverwaltung nicht integriert, da diese bei diesem Shop nicht unbedingt notwendig war, und alle Funktionalitäten über ein Adminflag in der Datenbank gelöst werden konnte.

Für die spätere Zahlungs- bzw. Rechnungsprüfung wird eine nachgelagerte Backendlösung angedacht diese soll dann die Prüfung der Einzahlungen gegen die Rechnungen prüfen und die Bestellstati daraufhin ändern.

<h3>Heroku</h3>

Um den Webshop auch live zu sehen können sie unter folgendem Link eine Deployte Version des Webshops finden.
[KLICK MICH!](https://secure-depths-1523.herokuapp.com/)

Viel Spaß beim verwenden/durchklicken des Webshops!

<h3>Dokumentation und User Stories</h3>

Eine Ausführliche Dokumentation und die User Stories finden Sie in der Wiki<br>
[Zum Wiki!](https://github.com/dotdottrue/shop/wiki)

Um auf Heroku zu Deployen und das seeden der Daten zu generieren muss folgendes angepasst werden.
Im Product Model müssen folgende Daten angepasst werden:

```
has_attached_file :avatar, :styles => { :large =>'400x400', :medium => '350x250', :small => '200x200', :mini => '100x100' }, :default_url => '/images/:style/missing.png',
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join('config/dropbox.yml'),
                    :path => ':style/:id_:filename'
 ```
 
 In der config/dropbox.yml müssen folgende Daten configuriert werden:
 ```
 app_key: "Bitte hier den eigenen Dropbox-Key eintragen"
app_secret: "Bitte hier den eigenen App-secret code eintragen"
access_token: "Bitte hier den eigenen Access_token eintragen"
access_token_secret: "Bitte hier den eigenen access_token_secret code eintragen"
user_id: "Die eigene User_id eintragen"
access_type: "app_folder"
```

<h3>Gemliste</h3>

<p>In dem Webshop wurden folgende Gems verwendet:</p>
```
Alle verwendeten Gems inkl. Versionsnummer in den Klammern)
Ruby Standard Gems:
  gem 'rails', '4.2.0'
  gem 'sass-rails', '~> 5.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'sqlite3'( (1.3.10) (für die Entwicklung später Postgres))
  gem 'coffee-rails', '~> 4.1.0'
  gem 'jquery-rails' (4.0.3)
  gem 'turbolinks' (2.5.3)
  gem 'jbuilder', '~> 2.0'
  gem 'sdoc', '~> 0.4.0'
  gem 'byebug' (3.5.1)
  gem 'web-console', '~> 2.0'
  gem 'spring (1.2.0)
 
 Gems um das Projekt zu Realisieren:
  gem 'paperclip' (Version 4.2.0)
  gem 'therubyracer' (0.12.1)
  
  Produktivbetrieb
    gem 'rails_12factor' (0.0.3)
    gem 'pg' (0.18.1)
  
  Testen und Entwicklung
    gem 'quiet_assets' (1.0.3)
    gem 'better_errors' (2.0.0)
    gem 'binding_of_caller'  (>= 0.7.2)
    gem 'rspec-rails' (3.1.0)
    gem 'factory_girl_rails' (4.5.0)
    gem 'guard-rspec' (4.3.1)
    gem 'faker' (1.4.3)
    gem 'capybara' (2.4.4)
  
  Page-Layout
    gem 'twitter-bootstrap-rails' (3.2.0)
    gem 'less-rails' (2.6.0)
    gem 'will_paginate-bootstrap'
    gem 'font-awesome-rail'(Version 4.2.0.0)
  
  Benutzerverwaltung:
    gem 'devise' (3.4.1)
    gem 'devise-bootstrap-views' (0.0.4)
```
