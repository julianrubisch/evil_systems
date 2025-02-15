require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

# EvilMartians like setup for Minitest
module EvilSystems
  # To be called before module +ApplicationSystemTest+
  # @param task [String, nil] ("assets:precompile") - the precompile task to run
  # @param silent [Boolean] (true) - silence build output and only show asset compilation and time spent compiling.
  # @return void
  # @see Settings#initial_setup
  # @see RegisterCuprite#initial_setup
  # @see PrecompileAssets#initial_setup
  def self.initial_setup(task: "assets:precompile", silent: true)
    Settings.initial_setup
    RegisterCuprite.initial_setup
    PrecompileAssets.initial_setup(task: task, silent: silent)
  end
end

require "evil_systems/engine" if defined?(Rails)
