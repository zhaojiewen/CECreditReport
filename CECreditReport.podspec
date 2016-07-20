#
#  Be sure to run `pod spec lint CECreditReport.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CECreditReport"
  s.version      = "0.0.1"
  s.summary      = "CECreditReport SDK."

  s.description  = <<-DESC
		   This Pod contains CECreditReport SDK. For more informations,please read http://fuqian.la/documentation.html (in chinese).
                   DESC

  s.homepage     = "https://github.com/zhaojiewen/CECreditReport.git"

  s.license      = "MIT"

  s.author             = { "xuhaiqing" => "haiqingxu@creditease.cn" }
  s.platform     = :ios, "7.0"

  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/zhaojiewen/CECreditReport.git", :tag => "#{s.version}" }

  s.source_files  = "CECreditReport", "CECreditReport/*.h"
  s.preserve_paths = "CECreditReport/*.a"
  s.public_header_files = "CECreditReport/*.h"
  s.resources = "CECreditReport/Resources/*"
  s.frameworks = "Foundation", "Security","SystemConfiguration"
  s.vendored_libraries = "CECreditReport/libCECreditReportSDK.a"
  s.requires_arc = true
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }

# @author xuhaiqing
end
