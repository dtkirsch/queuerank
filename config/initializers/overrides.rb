# Don't let Rails add a utf8=? param to GET forms.
# See http://stackoverflow.com/questions/3222013/what-is-the-snowman-param-in-rails-3-forms-for for details.
module ActionView::Helpers::FormTagHelper
private

  def extra_tags_for_form_with_snowman_excluded_from_gets(html_options)
    old = extra_tags_for_form_without_snowman_excluded_from_gets(html_options)
    if old.include?('"_method"')  # Non-GET.
      old
    else
      old.gsub(/(<[^>]+name="utf8"[^>]+"&#x2713;"[^>]*>)|(ilter)/, '')
    end
  end
  alias_method_chain :extra_tags_for_form, :snowman_excluded_from_gets

end