# coding: utf-8

#
# Repository
#
source 'https://github.com/CocoaPods/Specs.git'

#
# Setting
#
use_frameworks!

def shared_pods
    pod 'Fabric'
    pod 'Crashlytics'
end

abstract_target 'ios' do
    platform :ios, '9.0'
    shared_pods

    target 'ProjectTemplate' do
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'YES'
            config.build_settings['SWIFT_VERSION'] = "4.0"
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
    end
end

# vim: ft=ruby sw=4 ts=4 sts=4
