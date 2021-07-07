require "yaml"

def load_library(file)
  hash = YAML.load_file(file) # Use load_file to get an initial hash of arrays.
  hash.each_pair do |meaning, emote_array| # Use each_pair enumerbale to give us access to the first hash.
    hash[meaning] = { :english => emote_array[0], :japanese => emote_array[1] } # For each top-level key (`meaning`), assign a hash of arrays with :english, :japanese languages as the keys.
  end
end

def get_japanese_emoticon(file, icon)
  hash = load_library(file) # Use our previous method to load the yaml file and add our `languages` keys.
  hash.each_pair do |meaning, languages| # Use each_pair enumerable to give us access to the first nested hash that we just made.
    languages.each_pair do |emote| # Use each_pair enumerable to give us access to the language/emoticon pairs.
      if icon == emote[1]
        return languages[:japanese] # If the icon parameter matches the current emoticon, return the equivalent Japanese emoticon.
      end
    end
  end
  return "Sorry, that emoticon was not found" # If nothing returned from our loop, we didn't find that emote.
end

def get_english_meaning(file, icon)
  hash = load_library(file)
  hash.each_pair do |meaning, languages|
    languages.each_pair do |emote|
      if icon == emote[1]
        return meaning # The logic is the exact same as the above method, except we return the assigned key (`meaning`) if the icon parameter matches the current emoticon.
      end
    end
  end
  return "Sorry, that emoticon was not found" # If nothing returned from our loop, we didn't find that emote.
end
