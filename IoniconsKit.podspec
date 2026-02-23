Pod::Spec.new do |s|
  s.name             = 'IoniconsKit'
  s.version          = '2.0.0'
  s.summary          = 'Ionicons v4 for Swift with UIKit and SwiftUI support.'
  s.description      = <<-DESC
    IoniconsKit provides type-safe access to the Ionicons v4 icon font
    (696 icons) for both UIKit and SwiftUI applications.
    Icons have iOS and Material Design variants.
  DESC

  s.homepage         = 'https://github.com/keitaoouchi/IoniconsKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'keita.oouchi' => 'keita.oouchi@gmail.com' }
  s.source           = { :git => 'https://github.com/keitaoouchi/IoniconsKit.git', :tag => s.version.to_s }

  s.ios.deployment_target     = '18.0'
  s.osx.deployment_target     = '26.0'
  s.tvos.deployment_target    = '18.0'
  s.watchos.deployment_target = '11.0'
  s.swift_version = '6.0'

  s.source_files = 'IoniconsKit/Classes/**/*.{swift,h}'
  s.resource_bundles = {
    'IoniconsKit' => ['IoniconsKit/Assets/*.ttf']
  }
end
