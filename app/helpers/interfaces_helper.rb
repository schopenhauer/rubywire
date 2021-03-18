require 'rouge'

module InterfacesHelper

  def highlight_syntax(str)
    lexer = Rouge::Lexers::Conf.new
    formatter = Rouge::Formatters::HTMLInline.new('github')
    formatter.format(lexer.lex(str)).strip.html_safe
  end

end
