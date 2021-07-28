Pod::Spec.new do |spec|

  spec.name         = "EKeychainManager"
  spec.version      = "0.0.3"
  spec.summary      = "This cocoapods will help you to manage a token in keychain"

  spec.description  = <<-DESC
A Manager to storage tokens from applications into keychain without increasing the amount of busines rules or code in general to do this.
                   DESC


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #
  spec.homepage     = "https://github.com/Evino/ekeychain"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Lucas" => "lucasmirsoa@icloud.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  spec.platform     = :ios

  spec.ios.deployment_target = "10.3"

  spec.swift_version = '5.0'

  spec.source       = { :git => "https://github.com/Evino/ekeychain.git", :tag => "#{spec.version}" }
  
  spec.source_files  = "EKeychainManager/**/*.{h,m,swift}"
  
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"

end
