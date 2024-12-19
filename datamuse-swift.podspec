Pod::Spec.new do |s|
  s.name = 'datamuse-swift'
  s.version = '1.0.0' # Updated version
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'A modern Datamuse API Swift wrapper with support for async/await'
  s.homepage = 'http://ezefranca.com'
  s.social_media_url = 'https://github.com/ezefranca/datamuse-swift'
  s.authors = { "Ezequiel França" => "ezequiel.ifsp@gmail.com" }
  s.source = { :git => "https://github.com/ezefranca/datamuse-swift.git", :tag => s.version.to_s }

  # Updated platform versions for modern concurrency features
  s.platforms = {
    :ios => "15.0",
    :osx => "12.0",
    :tvos => "15.0",
    :watchos => "8.0"
  }

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files = "Sources/**/*.swift"
    ss.frameworks = "Foundation"
  end
end
