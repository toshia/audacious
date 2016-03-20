# -*- coding: utf-8 -*-

Plugin.create(:audacious) do
  command(:audacious_post_current_song,
          name: '再生中の楽曲を貼り付け',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox) do |opt|
    postbox = Plugin::GUI::Postbox.instance
    postbox.options = {footer: "Now Playing #{`audtool current-song`.chomp}", delegate_other: false}
    Plugin::GUI::Window.instance(:default) << postbox
  end

  command(:audacious_play,
          name: 'Audacious 再生',
          condition: lambda{ |opt| true },
          visible: true,
          role: :window) do |opt|
    bg_system('audtool playback-play')
  end

  command(:audacious_pause,
          name: 'Audacious 一時停止',
          condition: lambda{ |opt| true },
          visible: true,
          role: :window) do |opt|
    bg_system('audtool playback-pause')
  end
end
