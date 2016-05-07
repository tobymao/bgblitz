require_relative 'base'

module Views
  class Page < Base
    needs :csrf_tag

    DEFAULT_LINKS = [
      ['Home', '/'],
      ['Podcasts', '/podcasts'],
      ['Videos', '/videos'],
      ['About Us', '/about'],
      ['Sponsors', '/sponsors'],
      ['Contact', '/contact'],
    ].freeze

    def content
      html do
        head do
          link rel: 'stylesheet', type: 'text/css', href: 'https://fonts.googleapis.com/css?family=Open+Sans'
          link rel: 'stylesheet', type: 'text/css', href: '/vendor/reset.min.css'
          render_head
          render_style
          meta name: 'viewport', content: 'width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0'
          meta name: 'apple-mobile-web-app-capable', content: 'yes'
        end

        div do
          div style: CONTAINER_STYLE do
            render_banner
          end

          render_nav

          div style: CONTAINER_STYLE do
            render_main
          end

          render_footer
        end
      end
    end

    def render_head
      title 'Board Game Blitz'
    end

    def render_style
      style <<~CSS
        body {
          font-family: 'Open Sans';
          width: 100%;
          text-align: center;
        }
      CSS
    end
    static :render_style

    def render_banner
      widget Banner
    end

    def render_nav
      widget Nav.new(links: DEFAULT_LINKS)
    end

    def render_main
      text 'This page intentionally left blank.'
    end

    def render_footer
      s = inline'position' => 'absolute', 'bottom' => '0'

      div style: s do
        text 'Site map, contact, copyright. etc'
      end
    end
  end
end
