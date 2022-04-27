ZEITWERK_LOADER = Zeitwerk::Loader.new
ALL_DIRS = Dir.glob('**/*/')
ZEITWERK_PUSH_DIRS = ['lib/', 'app/'].freeze
ZEITWERK_PUSH_DIRS.each do |push_dir|
  ALL_DIRS.each do |dir|
    ZEITWERK_LOADER.push_dir("#{__dir__}/../../#{dir}") if dir.include?(push_dir)
  end
end
ZEITWERK_LOADER.setup
