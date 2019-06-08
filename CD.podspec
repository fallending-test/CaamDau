
Pod::Spec.new do |s|
  s.name             = 'CD'
  s.version          = '0.6.42'
  s.summary          = 'A iOS development toolbox (iOS 开发工具箱(模块插件) Swift 版).'
  s.description      = <<-DESC
  TODO: iOS 模块插件 Swift 版：iOS项目开发通用&非通用型模块代码，多功能插件，可快速集成使用以大幅减少基础工作量；附.各种类库使用示例demo.
                       DESC

  s.homepage         = 'https://github.com/liucaide/CD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liucaide' => '565726319@qq.com' }
  s.source           = { :git => 'https://github.com/liucaide/CD.git', :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'
  # s.source_files = 'CD/**/*'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |cd|
    cd.source_files = 'CD/CD.swift'
    cd.dependency 'CD/Extension'
    cd.dependency 'CD/Form'
    cd.dependency 'CD/Chain'
    cd.dependency 'CD/CountDown'
    cd.dependency 'CD/Value'
    cd.dependency 'CD/RegEx'
  end
  
  s.subspec 'Module' do |mo|
    mo.dependency 'CD/Core'
    mo.dependency 'CD/IBInspectable'
    mo.dependency 'CD/InputBox'
    mo.dependency 'CD/IconFont'
    mo.dependency 'CD/Page'
    mo.dependency 'CD/TopBar'
    mo.dependency 'CD/AppDelegate'
    
    mo.dependency 'CD/MVVM'
    mo.dependency 'CD/HUD'
  end
  
  s.subspec 'All' do |all|
    all.dependency 'CD/Core'
    all.dependency 'CD/Module'
    
    all.dependency 'CD/FDFullscreenPopGesture'
    all.dependency 'CD/MJRefresh'
    
  end
  
  
  # ---- 核心扩展
  s.subspec 'Extension' do |es|
      es.source_files = 'CD/CD_Extension/*.{swift}', 'CD/CD.swift'
      es.dependency 'CD/Form'
  end
  
  s.subspec 'IBInspectable' do |ib|
    ib.source_files = 'CD/CD_IBInspectable/*.{swift}'
  end
  
  s.subspec 'Form' do |fm|
      fm.source_files = 'CD/CD_Form/*.{swift}'
  end
  
  s.subspec 'Chain' do |cn|
      cn.source_files = 'CD/CD_Chain/*.{swift}', 'CD/CD.swift'
      cn.dependency 'CD/Extension'
  end
  
  s.subspec 'CountDown' do |down|
    down.source_files = 'CD/CD_CountDown/*.{swift}'
    down.dependency 'CD/Extension'
  end
  
  s.subspec 'Value' do |v|
    v.source_files = 'CD/CD_Value/*.{swift}'
  end
  
  s.subspec 'RegEx' do |regex|
    regex.source_files = 'CD/CD_RegEx/*.{swift}', 'CD/CD.swift'
    regex.dependency 'CD/Extension'
    regex.dependency 'CD/Value'
  end
  
  # ---- 核心插件 组件
  s.subspec 'AppDelegate' do |app|
    app.source_files = 'CD/CD_AppDelegate/*.{swift}'
  end
  
  s.subspec 'IconFont' do |ifont|
      ifont.source_files = 'CD/CD_IconFont/Classes/*.{swift}'
      ifont.resource_bundles = {
          'IconFont' => ['CD/CD_IconFont/Assets/*.{ttf}']
      }
      ifont.dependency 'CD/Extension'
  end
  
  s.subspec 'TopBar' do |topbar|
      topbar.source_files = 'CD/CD_TopBar/*.{swift}'
      topbar.dependency 'CD/Core'
      topbar.dependency 'CD/IconFont'
      topbar.dependency 'CD/FDFullscreenPopGesture'
      topbar.dependency 'SnapKit', '~> 4.2.0'
  end
  
  s.subspec 'Page' do |page|
      page.source_files = 'CD/CD_Page/*.{swift}'
      page.dependency 'CD/Core'
      page.dependency 'CD/FDFullscreenPopGesture'
      page.dependency 'SnapKit', '~> 4.2.0'
  end
  
  s.subspec 'InputBox' do |input|
      input.source_files = 'CD/CD_InputBox/*.{swift}'
      input.dependency 'CD/Core'
      input.dependency 'SnapKit', '4.2.0'
  end
  
  s.subspec 'HUD' do |hud|
    hud.source_files = 'CD/CD_HUD/*.{swift}'
    hud.dependency 'CD/Core'
    hud.dependency 'CD/IconFont'
    hud.dependency 'SnapKit', '4.2.0'
  end
  
  s.subspec 'MVVM' do |vm|
    vm.source_files = 'CD/CD_MVVM/*.{swift}'
    vm.dependency 'CD/Core'
    vm.dependency 'CD/TopBar'
    vm.dependency 'CD/MJRefresh'
    vm.dependency 'SnapKit', '~> 4.2.0'
  end
  
  # ---- 第三方 扩展 或 桥接
  s.subspec 'MJRefresh' do |mj|
    mj.source_files = 'CD/CD_MJRefresh/*.{swift}', 'CD/CD.swift'
    mj.dependency 'MJRefresh', '3.1.15.7'
  end
  
  s.subspec 'FDFullscreenPopGesture' do |fd|
      fd.source_files = 'CD/CD_FDFullscreenPopGesture/*.{swift}', 'CD/CD.swift'
      fd.dependency 'FDFullscreenPopGesture', '1.1'
  end
  
  #s.resource_bundles = {
  #  'CD' => ['CD/Storyboards/*.{storyboard}']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Then'
end
