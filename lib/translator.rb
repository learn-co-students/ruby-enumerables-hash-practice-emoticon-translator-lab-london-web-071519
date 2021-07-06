# require modules here
require "yaml"
require 'pry'
emotes = YAML.load_file('lib/emoticons.yml')

def load_library(emotes)
  newHash = {}
  newHash["get_meaning"] = {}
  newHash["get_emoticon"] = {}
  
  emotes = YAML.load_file('lib/emoticons.yml')
    emotes.each do |key, value|
      newHash[key]
      newHash["get_meaning"][value[1]] = key
      newHash["get_emoticon"][value[0]] = value[1]
    end
  newHash
end


def get_japanese_emoticon(emotes, emoticon)
  emotes = load_library(emotes)
  
  if emotes.values[1].keys.include?(emoticon)
    return emotes.values[1][emoticon]
  end
  
  if emotes.values[1].keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emotes, emoticon)
  emotes = load_library(emotes)
  if emotes.values[1].values.include?(emoticon)
    return emotes["get_meaning"][emoticon]
  end
  
  if emotes.values[1].keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  end
end