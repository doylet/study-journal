module ApplicationHelper
    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
          CodeRay.scan(code, language).div
        end
      end
    
      def markdown(text)
        coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
          options = {
            :fenced_code_blocks => true,
            :no_intra_emphasis => true,
            :autolink => false,
            :strikethrough => true,
            :lax_html_blocks => true,
            :superscript => true,
            :quote => true
          }
        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
      end
    end

    class LatexMarkdown < Redcarpet::Render::HTML
      def preprocess(text)
        wrap_latex(text)
      end
    
      def wrap_latex(text)
        text.gsub! /(\$\$)(.+)(\$\$)/ do
          "#{$1}\[#{$2}\]#{$3}"
        end
        text
      end
    end

    # app/helpers/application_helper.rb
    def latex_markdown_to_html(text)
      renderer = LatexMarkdown.new(:filter_html => true, :hard_wrap => true)
      # These options might be helpful but are not required
      options = {
        safe_links_only: true,
        no_intra_emphasis: true,
        autolink: true
      }
      Redcarpet::Markdown.new(renderer, options).render(text).html_safe
    end
