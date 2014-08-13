#
# Be sure to run `pod lib lint AKUTestKit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AKUTestKit"
  s.version          = "1.0.1"
  s.summary          = "A library for generating random NSString, NSDate, NSNumber, etc."
  s.description      = <<-DESC
                       See each generator's header.

AKUTestKit.h
AKUDateGenerator.h
AKUFixedDate.h
AKUInfinityList.h
AKUListFunctional.h
AKULoseDictionaryGenarator.h
AKUNumberGenerator.h
AKURandString.h
AKURegularString.h
AKUStringGenerator.h
AKUChiSquaredTest.h
                       DESC
  s.homepage         = "https://github.com/akuraru/AKUTestKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "akuraru" => "akuraru@gmail.com" }
  s.source           = { :git => "https://github.com/akuraru/AKUTestKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/akuraru'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/', 'Pod/Classes/check', 'Pod/Classes/generator' 
  # s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
