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
  s.prepare_command = <<-CMD
                   
echo "---mkdir-----"

read -p "请输入要创建的路径：" location

echo $location

mkdir "$location"

cd "$location"

echo "---Generating RSA key pair ..."
echo "1024 RSA key: private_key.pem"
openssl genrsa -out private_key.pem 1024

echo "---create certification require file: rsaCertReq.csr"
openssl req -new -key private_key.pem -out rsaCertReq.csr

echo "---create certification using x509: rsaCert.crt"
openssl x509 -req -days 3650 -in rsaCertReq.csr -signkey private_key.pem -out rsaCert.crt

echo "---create public_key.der For IOS"
openssl x509 -outform der -in rsaCert.crt -out public_key.der

echo "---create private_key.p12 For IOS. Please remember your password. The password will be used in iOS."
openssl pkcs12 -export -out private_key.p12 -inkey private_key.pem -in rsaCert.crt

echo "---create rsa_public_key.pem For Java"
openssl rsa -in private_key.pem -out rsa_public_key.pem -pubout
echo "---create pkcs8_private_key.pem For Java"
openssl pkcs8 -topk8 -in private_key.pem -out pkcs8_private_key.pem -nocrypt

echo "---finished."

			CMD
end
