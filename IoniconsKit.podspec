Pod::Spec.new do |s|
  s.name             = 'IoniconsKit'
  s.version          = '1.0.0'
  s.summary          = 'ionicons for Swift and Objective-C with type safed manner.'
  s.homepage         = 'https://github.com/keitaoouchi/IoniconsKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'keita.oouchi' => 'keita.oouchi@gmail.com' }
  s.source           = { :git => 'https://github.com/keitaoouchi/IoniconsKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'IoniconsKit/Classes/**/*.{swift,h}'
  s.resource_bundles = {
     'IoniconsKit' => ['IoniconsKit/Assets/*.ttf']
  }
end
