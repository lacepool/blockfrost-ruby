# frozen_string_literal: true

require 'yaml'

module Configuration
  class << self
    def default_config
      YAML.safe_load(
        File.open("#{File.dirname(__FILE__)}/config.yml").read
      ).transform_keys(&:to_sym)
    end

    def define_config(config)
      result = default_config
      config.each do |key, value|
        result[key] = value unless result[key].nil?
      end
      result
    end
  end
end
