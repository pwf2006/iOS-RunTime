#
#  Be sure to run `pod spec lint iOS-RunTime.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "iOS-RunTime"
  s.version      = "1.0.0"
  s.summary      = "通过iOS RunTime时的一些特性"
  s.description  = "通过iOS RunTime时的一些特性,获取类的properties,ivars,instance methods, class methods"

  s.homepage     = "https://github.com/pwf2006/iOS-RunTime"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "pwf2006" => "674423263@qq.com" }

  s.platform     = :ios
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/pwf2006/iOS-RunTime.git", :tag => "#{s.version}" }

  s.source_files  = "FirstGit/HomeController.*"
  s.exclude_files = "Classes/Exclude"

end
