#
# Be sure to run `pod lib lint LgBaseSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LgBaseSDK'
  s.version          = '0.6.2'
  s.summary          = 'A short description of LgBaseSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 基础的组件库.
                       DESC

  s.homepage         = 'https://github.com/lusugu/LgBaseSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lusugu2004@163.com' => 'lusugu2004@163.com' }
  s.source           = { :git => 'https://github.com/lusugu/LgBaseSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  
  s.source_files = 'LgBaseSDK/Classes/**/*'
  s.resource_bundles = {
    'LgBaseSDK' => ['LgBaseSDK/Exclude/LgBaseSDK.bundle']
  }
  
  s.user_target_xcconfig = {
      'GENERATE_INFOPLIST_FILE' => 'YES'
  }

  s.pod_target_xcconfig = {
      'GENERATE_INFOPLIST_FILE' => 'YES'
  }

#  s.resource_bundles = {
#    'LgBaseSDK' => ['LgBaseSDK/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.dependency 'SnapKit'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'RxDataSources'
  s.dependency 'JXSegmentedView'
  s.dependency 'GTMRefresh'

end
