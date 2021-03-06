require 'pe_build'

module PEBuild
  module Release

    require 'pe_build/release/instance'

    @releases = {}

    def self.[](ver)
      release = @releases[ver]

      if release.nil?
        logger = Log4r::Logger.new('vagrant::pe_build::release')
        logger.warn I18n.t 'pebuild.release.unknown_version',
          :missing_version => ver,
          :latest_version  => LATEST_VERSION
        release = @releases[LATEST_VERSION]
      end

      release
    end

    def self.newrelease(&blk)
      PEBuild::Release::Instance.new(&blk)
    end

    require 'pe_build/release/2_0'
    require 'pe_build/release/2_5'
    require 'pe_build/release/2_6'
    require 'pe_build/release/2_7'
    require 'pe_build/release/2_8'
    require 'pe_build/release/3_0'
    require 'pe_build/release/3_1'

    LATEST_VERSION = '3.1.0'
  end
end
