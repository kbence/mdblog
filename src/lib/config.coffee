
class Config
  constructor: (config) ->
    if typeof config != 'object'
      throw new Error("Config must be initialized with an object!")

    @config = {}

    for field, value of config
      @config[field] = if typeof value == 'object' then new Config(value) else value

  get: (name, defaultValue) ->
    parts = name.split '.'
    if typeof @config[parts[0]] != 'undefined'
      if parts.length == 1
        @config[parts[0]] ? defaultValue
      else
        @config[parts[0]].get parts[1..].join('.'), defaultValue
    else
      defaultValue

exports.Config = Config
