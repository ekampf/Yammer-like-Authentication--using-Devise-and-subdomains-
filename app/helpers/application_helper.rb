module ApplicationHelper
  def flash_messages
    result =""
      %w(notice warning error alert).each do |msg|
        result <<  content_tag(:div, content_tag(:p, flash[msg.to_sym]),
          :class => "message #{msg}") unless flash[msg.to_sym].blank?
      end
      result.html_safe
  end
end
