
Pod::Spec.new do |s|

    s.name         = "SFBNetwork"
    s.version      = "0.0.1"
    s.summary      = "A network framework based on AFNetworking."

    s.homepage     = "https://github.com/SoftBoys/SFBNetwork"

    s.source       = { :git => "https://github.com/SoftBoys/SFBNetwork.git", :tag => s.version.to_s }

    s.license      = "MIT"

    s.author       = { "SoftBoys" => "gjw_1019@163.com" }

    s.platform     = :ios, "8.0"

    s.source_files = "SFBNetwork"

    s.requires_arc = true

    s.dependency "AFNetworking", "~> 3.1.0"

end
