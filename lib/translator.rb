# require modules here
require "yaml"

def load_library(path)

  emojicon = YAML.load_file(path)
  lib = {}
  lib["get_meaning"] = {}
  lib["get_emoticon"] = {}
    emojicon.each{ |eng, emojis|
      lib["get_meaning"][emojis[1]] = eng
      lib["get_emoticon"][emojis[0]] = emojis[1]
    }
  lib
end

def get_japanese_emoticon(path, emoticon)
  temp = load_library(path)
    if temp["get_emoticon"][emoticon]
      temp["get_emoticon"][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(path, emoticon)
  temp = load_library(path)
   if temp["get_meaning"][emoticon]
     temp["get_meaning"][emoticon]
   else
     return "Sorry, that emoticon was not found"
   end
 end
