# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({
              email: 'todd@toadkicker.com',
              password: 'glade123',
              is_admin: true,
              locale: 'en'
            })

def load_translations
  en_seed_file = Rails.root.join('config', 'locales', 'migrated-to-db', 'en.yml')
  en_yml = YAML.load_file(en_seed_file)

  en_yml.fetch('en').each {|k, v| Translation.create(key: k, value: v, locale: 'en')}

  devise_en_seed_file = Rails.root.join('config', 'locales', 'migrated-to-db', 'devise.en.yml')
  devise_yml = YAML.load_file(devise_en_seed_file)

  devise_yml.fetch('en').each {|k, v| Translation.create(key: k, value: v, locale: 'en')}

  kr_seed_file = Rails.root.join('config', 'locales', 'migrated-to-db', 'ko-kr.yml')
  kr_yml = YAML.load_file(kr_seed_file)

  kr_yml.fetch('ko-kr').each {|k, v| Translation.create(key: k, value: v, locale: 'ko-kr')}
end

load_translations

