{ ... }:

{
  home.file = {
    ".config/gtk-3.0/settings.ini".text = ''
[Settings]
gtk-theme-name=Adwaita-Dark
gtk-icon-theme-name=Adwaita-Dark
gtk-font-name=Cantarell 11
gtk-cursor-theme-name=Adwaita-Dark
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintslight
gtk-xft-rgba=rgb
gtk-application-prefer-dark-theme=1
    '';
    ".config/gtk-4.0/settings.ini".text = ''
      [Settings]
      gtk-application-prefer-dark-theme=true
    '';
  };
}