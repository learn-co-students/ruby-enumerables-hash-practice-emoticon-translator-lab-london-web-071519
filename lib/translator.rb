require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)

  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key,val|
    new_hash['get_emoticon'][val[0]] = emoticons[key][1]
    new_hash['get_meaning'][val[1]] = key
  end
  new_hash
end


def get_japanese_emoticon(file, emot)
  result = load_library(file)['get_emoticon'][emot]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emot)
  result = load_library(file)['get_meaning'][emot]
  result ? result : "Sorry, that emoticon was not found"
end 