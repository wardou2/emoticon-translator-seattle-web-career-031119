require "pry"
require "yaml"

def load_library(file_path)
  new_hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  yaml_hash = YAML.load_file(file_path)

  yaml_hash.each do |meaning, emoticon_list|

    new_hash['get_meaning'][emoticon_list[1]] = meaning
    new_hash['get_emoticon'][emoticon_list[0]] = emoticon_list[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  translation = load_library(file_path)
  if translation['get_emoticon'][emoticon]
    translation['get_emoticon'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  translation = load_library(file_path)
  if translation['get_meaning'][emoticon]
    translation['get_meaning'][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
