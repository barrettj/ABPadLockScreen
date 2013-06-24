Pod::Spec.new do |s|
  s.name     = 'Barrett-ABPadLockScreen'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'A fork of ABPadLockScreen.'
  s.homepage = 'https://github.com/barrettj/ABPadLockScreen'
  s.author   = { 'Barrett Jacobsen' => "admin@barrettj.com" }
  s.source   = { :git => 'https://github.com/barrettj/ABPadLockScreen.git', :tag => '1.0.0' }
  s.platform = :ios  
  s.source_files = 'ABLockScreen/*.{h,m}'
  s.resources = 'ABLockScreen/Assets/*.png'
end