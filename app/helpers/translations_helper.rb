module TranslationsHelper
  def translation_keys
    Translation.select(:key).distinct.map(&:key)
  end

  def translation_for_key(translations, key)
    hits = translations.to_a.select {|t| t.key == key}
    hits.first
  end

  def all_locales
    Translation.select(:locale).distinct.map(&:locale)
  end
end
