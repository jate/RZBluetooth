# -*- coding: utf-8 -*-
Pod::Spec.new do |s|
  s.name         = "RZBluetooth"
  s.version      = "1.3.0"
  s.summary      = "A Core Bluetooth helper library to simplify the development and testing of Core Bluetooth applications."

  s.description  = <<-DESC
RZBluetooth is a Core Bluetooth helper with 3 primary goals:

- Simplify the delegate callbacks and encourage best practices
- Provide a pattern for Profile level APIs, with support for public profiles
- Simplify and encourage testing - including unit tests, automated integration tests, and manual tests.
                   DESC

  s.homepage     = "http://github.com/Raizlabs/RZBluetooth"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Brian King" => "brianaking@gmail.com" }
  s.source       = { :git => "https://github.com/Raizlabs/RZBluetooth.git", :tag => s.version }
  s.requires_arc = true
  s.osx.deployment_target = "10.10"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "4.0"

  s.default_subspec = "Core"

  s.subspec "Core" do |core|
    core.osx.deployment_target = "10.10"
    core.ios.deployment_target = "8.0"
    core.watchos.deployment_target = "4.0"
    core.pod_target_xcconfig = { 'CLANG_WARN_UNGUARDED_AVAILABILITY' => 'NO' }
    core.source_files = "RZBluetooth/**/*.{h,m}"
    core.public_header_files = "RZBluetooth/**/*.h"
    core.private_header_files = "RZBluetooth/**/*+Private.h", "RZBluetooth/Command/*.h", "RZBluetooth/RZBCentralManager+CommandHelper.h"
  end

  s.subspec "Mock" do |mock|
    mock.osx.deployment_target = "10.10"
    mock.ios.deployment_target = "8.0"
    mock.dependency "RZBluetooth/Core"
    mock.source_files = "RZMockBluetooth/**/*.{h,m}"
    mock.public_header_files = "RZMockBluetooth/**/*.h"
    mock.private_header_files = "RZMockBluetooth/**/*+Private.h"
  end

  s.subspec "Test" do |test|
    test.osx.deployment_target = "10.10"
    test.ios.deployment_target = "8.0"
    test.dependency "RZBluetooth/Mock"
    test.frameworks = "XCTest"
    test.source_files = "RZBluetoothTests/RZBTestDefines.h",
                        "RZBluetoothTests/RZBSimulatedTestCase.{h,m}",
                        "RZBluetoothTests/Helpers/NSRunLoop+RZBWaitFor.{h,m}"
    test.public_header_files = "RZBluetoothTests/RZBSimulatedTestCase.h", "RZBluetoothTests/RZBTestDefines.h"
  end
end
