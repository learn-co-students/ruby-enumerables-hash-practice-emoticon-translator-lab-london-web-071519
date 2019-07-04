
require "yaml"
require 'pry'


def load_library(file)
  got_data = YAML.load_file(file)
  my_hash = {"get_emoticon"  => {}, "get_meaning" => {}}
  got_data.each do |data|
  my_hash["get_meaning"][data[1][1]] = data[0]
  my_hash["get_emoticon"][data[1][0]] = data[1][1]
  end
  my_hash
end

def get_japanese_emoticon(file, emoticon)
  the_hash = load_library(file)
  the_hash["get_emoticon"].each do |data|
      if emoticon == data[0]
        return data[1]
      end
    end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  the_hash = load_library(file)
  the_hash["get_meaning"].each do |data|
      if emoticon == data[0]
         return data[1]
      end
    end
    return "Sorry, that emoticon was not found"
end
