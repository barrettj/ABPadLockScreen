Pod::Spec.new do |s|
  s.name     = 'Barrett-ABLockScreen'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'A fork of ABLockScreen.'
  s.homepage = 'https://github.com/barrettj/ABLockScreen'
  s.author   = { 'Barrett Jacobsen' => "admin@barrettj.com" }
  s.source   = { :git => 'https://github.com/barrettj/ABLockScreen.git', :tag => '1.0.0' }
  s.platform = :ios  
  s.source_files = 'ABLockScreen/*.{h,m}'
  s.resources = 'ABLockScreen/Assets/*.png'
end