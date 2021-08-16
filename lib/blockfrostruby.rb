# frozen_string_literal: true

# gem build blockfrostruby
# gem install ./blockfrostruby-0.1.0.gem
# require 'blockfrostruby'
# Blockfrostruby::CardanoMainNet

require_relative 'blockfrostruby/version'
require 'net/http'
require 'json'

module Blockfrostruby
  # Net::HTTP.get(uri).encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
  # https://dog.ceo/api/breeds/list/all

  # Should be separate module with only verbs action
  # puts res.body if res.is_a?(Net::HTTPSuccess)

  class Error < StandardError; end
  # raise error if body status error

  class Request
    def self.get_response(url, _params = {}, _headers = nil)
      # params = { :limit => 10, :page => 3, :order => 'desc' }
      # response = Net::HTTP.get_response(URI(url))
      
      puts url
      # uri = URI(url)
      # req = Net::HTTP::Get.new(uri)
      # req['project_id'] = "" # || _headers[:project_id]
      # response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(req) }
      # format_response(response)
    end

    def self.get_all_pages(url)
      # https://docs.ruby-lang.org/en/2.0.0/Net/HTTP.html
      # uri = URI('http://example.com/some_path?query=string')
      # Net::HTTP.start(uri.host, uri.port) do |http|
      #   request = Net::HTTP::Get.new uri
      #   response = http.request request # Net::HTTPResponse object
      # end
    end

    def self.format_response(response)
      body = response.header.content_type == 'application/json' ? JSON.parse(response.body) : response.body
      { status: response.code, body: body }
      # In config return whole object, default this one
    end
  end

  class CardanoMainNet
    # Should be grouped by endpoints
    def self.url
      "https://cardano-mainnet.blockfrost.io/api/v0" #TO CONFIG
    end
    
    def self.get_root
      Request.get_response("#{self.url}/")
    end

    def self.get_health
      Request.get_response("#{self.url}/health")
    end

    def self.get_health_clock
      Request.get_response("#{self.url}/health/clock")
    end

    def self.get_custom_url
      # used when user wants to add something in the url manually
    end
  end

  class CardanoTestNet < CardanoMainNet
    def self.url
      "another url"
    end
  end

  
end
