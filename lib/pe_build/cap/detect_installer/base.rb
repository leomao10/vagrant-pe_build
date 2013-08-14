class PEBuild::Cap::DetectInstaller::Base

  def self.detect_installer(machine, version)
    new(machine, version).detect
  end

  def initialize(machine, version)
    @machine, @version = machine, version
  end

  # @!method detect
  #   Return the installer for the given operating system
  #   @abstract
  #   @return [String] The installer for the given operating system
end
