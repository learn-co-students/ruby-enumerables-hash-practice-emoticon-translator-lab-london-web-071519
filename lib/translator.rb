# require modules here

require 'yaml'
require 'pry'

def load_library(yaml)
  # code goes here
  library = YAML.load_file(yaml)
  ordered_library = {"get_meaning" => {}, "get_emoticon" => {}}

    library.each do |name, emoticon|
      ordered_library["get_meaning"][emoticon[1]] = name
      ordered_library["get_emoticon"][emoticon[0]] = emoticon[1]
    end

  ordered_library

end

def get_japanese_emoticon(yaml, emoticon)
  # code goes here
  ordered_library = load_library(yaml)

    ordered_library.each do |dict, emoticons|
      if dict == "get_emoticon"
        emoticons.each do |english, japanese|
          if emoticon == english
            return japanese
          end
        end
      end
    end

  "Sorry, that emoticon was not found"

end

def get_english_meaning(yaml, emoticon)
  # code goes here
  ordered_library = load_library(yaml)

    ordered_library.each do |dict, emoticons|
      emoticons.each do |japanese, meaning|
        if emoticon == japanese
          return meaning
        end
      end
    end

  "Sorry, that emoticon was not found"

end
