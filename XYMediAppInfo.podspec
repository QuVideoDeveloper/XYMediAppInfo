Pod::Spec.new do |s|
  s.name             = 'XYMediAppInfo'
  s.version          = '1.0.1'
  s.summary          = '提供中台组件使用的App基本信息，例如区域、国家、产品id等'
  s.homepage         = 'https://github.com/QuVideoInc/XYMediAppInfo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gitsource' => 'gitsource@quvideo.com' }
  s.source           = { :git => 'https://github.com/QuVideoInc/XYMediAppInfo.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = "#{s.name}/Classes/**/*"
end
