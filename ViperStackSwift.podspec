#
# Be sure to run `pod lib lint ViperStackSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ViperStackSwift'
  s.version          = '0.9.3'
  s.summary          = 'ViperStackSwift helps you with VIPER'
  s.swift_version    = '4.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  ViperStackSwift is a library, that provide mechanism for connection between VIPER modules.
  Also there are some base classes and protocols for VIPER module.
  With this library you can navigate between modules objects named Segues.
  Segue is an object, that can customize opening UIViewController and it's animation.
  ViperStackSwift is wirtten in pure Swift.

                       DESC

  s.homepage         = 'https://github.com/igrampe/ViperStackSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'igrampe' => 'igrampe@gmail.com' }
  s.source           = { :git => 'https://github.com/igrampe/ViperStackSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.platform = :ios, '8.0'

  s.source_files = 'ViperStackSwift/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ViperStackSwift' => ['ViperStackSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
