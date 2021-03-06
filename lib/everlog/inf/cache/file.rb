class Everlog
  class Inf::Cache::File < Inf::Cache
    require 'localFileCache'
    require 'everlog/inf/cache/file/wunderground'

    def initialize
      service = self.class.name.split('::').last.downcase
      @cache = LocalFileCache.new("#{::File.dirname(__FILE__)}/data/#{service}")
    end

    def create(date, proc_args = {}, &api_proc)
      return @cache.get(date) if @cache.has?(date)
      data = api_proc.call(proc_args)
      @cache.set(date, data)
      data
    end

    def delete key
      @cache.delete key
    end

    def flush
      @cache.flush
    end
  end
end
