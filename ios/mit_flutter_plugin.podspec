
Pod::Spec.new do |s|
  s.name             = 'mit_flutter_plugin'
  s.version          = '1.0.0'
  s.summary          = 'MIT Geocode Flutter Plugin.'
  s.description      = <<-DESC
MIT Geocode Flutter Plugin.
                       DESC
  s.homepage         = 'https://metaindonesia.technology'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'PT Meta Indonesia Teknologi' => 'info@metaindonesia.technology' }

  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  s.ios.public_header_files = 'ios/Classes/Bridging-Header.h'
  s.ios.vendored_libraries = 'Classes/libmit_flutter_plugin.a'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

end
