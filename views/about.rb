require './views/page'

module Views
  class About < Page
    def render_main
      ambie_icons = [
        Icons::Icon.new('bgg', 'https://boardgamegeek.com/user/ambierona', 'BGG'),
        Icons::Icon.new('youtube', 'https://www.youtube.com/ambierona', 'Youtube'),
      ]

      text_style = inline line_height: '1.3em'

      render_box 'Ambie', BGB_BLUE, ambie_icons, 137, 103

      div style: text_style do
        text "Ambie has been playing games for as long as she can remember. When she was a kid, she played board, card, and video games "\
          "with her family (classics like Monopoly, Risk, Clue, Stratego, Rummikub, Gin, Euchre...). She also used to play D&D "\
          "with her family on camping trips. In college, she started playing 'modern' board games with friends, starting with Dominion "\
          "and Tichu. After graduating college, she and her boyfriend (now husband) started building up a collection and getting more "\
          "into the hobby together. Now, Ambie plays a lot of 2-player games with her husband. They enjoy thematic Euros - games that "\
          "integrate the mechanics with the theme. Some of Ambie's favorite games are The Resistance: Avalon, Codenames, Arkwright, Space "\
          "Alert, and Tragedy Looper. Outside of board games, she enjoys singing, knitting, crocheting, and Brazilian Jiu Jitsu."
      end

      cassadi_icons = [
        Icons::Icon.new('bgg', 'https://boardgamegeek.com/user/noajayne', 'BGG'),
      ]

      render_box 'Cassadi', BGB_PINK, cassadi_icons, 205, 171

      div style: text_style do
        text "Cassadi bio coming soon! "\
      end

      crystal_icons = [
        Icons::Icon.new('bgg', 'https://boardgamegeek.com/user/CrysP', 'BGG'),
      ]

      render_box 'Crystal', BGB_PURPLE, crystal_icons, 69, 35

      div style: text_style do
        text "Crystal bio coming soon! "\
      end
    end
    static :render_main

    def render_box name, color, icons, x, y
      box_style = inline(
        display: 'inline-block',
        color: 'white',
        width: '7em',
        font_size: '150%',
        margin: '.5em 0 .5em 0',
        text_transform: 'uppercase',
        text_align: 'center',
        vertical_align: 'top',
        background_color: color,
        padding: '.2em 0 .2em 0',
      )

      style Icons.icons_css(name, Icons::ICONS, x, y, 30)

      div style: box_style do
        text name
      end

      ul style: inline(display: 'inline-block', margin_top: '4px') do
        icons.each do |data|
          li class: "icon #{data.klass} #{name}" do
            a href: data.url, tooltip: data.name
          end
        end
      end
    end

  end
end
