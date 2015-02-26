<h1>Webentwicklung II Projekt</h1>
Das Projekt wurde in ```Ruby 2.2.0``` und< ```Rails 4.2.0```entwickelt.

Das Projekt beinhaltet einen funktionstüchtigen Webshop in welchem man sich als Benutzer registrieren kann und auch Einkäufe tätigen kann.

<h3>Starten der Applikation</h3>

Um das Repository zu verwenden sollte man im Schritt 1 dieses Klonen.<br />
Folgender Befehl ist dafür notwendig:<br />
``` git clone https://github.com/dotdottrue/shop.git ```
<br />
<p>Der nächste Schritt ist das ausführen des Bundlers um die Gems zu installieren:</p><br />
```bundle install```

Um eine reibungslose Verwendung von Paperclip sowie PG(PostgreSQL) zu gewährleisten wird empfohlen bzw.<br /> sollte noch folgendes per Commandline installiert werden.<br />
Für <strong>Paperclip</srong> sollten folgende Befehle ausgeführt werden:<br />
<strong>Mac: </strong><br />
```brew install imagemagick```
<br /><strong>Linux</strong><br />
```sudo apt-get install imagemagick```
<br /><strong>Windows</strong><br />
Falls Windows verwendet wird muss Imagemagick manuell installiert werden.<br />
Den Download finden Sie unter folgendem Link: [DownloadLink](http://gnuwin32.sourceforge.net/packages/file.htm)
<br /> <br />
Bei evtl. Problemen mit <strong>PostgreSQL</strong><br />
<strong>Mac: </strong><br />
```brew install imagemagick```
<br /><strong>Linux</strong><br />
```brew update``` 
<br />
```brew install postgresql```

Nachdem der Bundler durchgelaufen ist und oben genannte Befehle ausgeführt wurden (da notwendig oder durch Fehler)
kann die Datenbank migriert werden.

Befehl dafür ist:
```rake db:migrate```

Nach erfolgreichem Migrieren der Datenbank kann diese mit Testdaten/Seeds befüllt werden.
```rake db:seed```

Ab diesem Punkt ist die ist der Webshop einsatzbereit und voll funktionsfähig.

Es wird ein Adminuser bei den Seeds mit angelegt. Dieser kann produkte anlegen, und andere Daten einsehen, ändern etc.

Ein Standardbenutzer wird nicht mit angelegt, da dieser eigenständig Angelegt werden kann und die Funktionen mit diesem durchlaufen werden können.

Viel Spaß beim verwenden des Webshops!

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
    gem 'devise'
    gem 'devise-bootstrap-views'
```
