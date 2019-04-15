module ApplicationHelper
  def login_helper(style = '', tag_type)
    if current_user.is_a?(GuestUser)
      "<#{tag_type}><a href='#{new_user_registration_path}' class='#{style}'>Register</a></#{tag_type}>".html_safe +
       "<#{tag_type}><a href='#{new_user_session_path}' class='#{style}'>Login</a></#{tag_type}>".html_safe
    else
      "<#{tag_type}><a href='#{destroy_user_session_path}' class='#{style}'>Logout</a></#{tag_type}>".html_safe
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me', contact_path } if you'd like to work together."
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    CorleyViewTool::Renderer.copyright 'John Corley', "All Rights Reserved."
  end

  def nav_items
    [
        {
            url: root_path,
            title: 'Home'
        },
        {
            url: about_me_path,
            title: 'About Me'
        },
        {
            url: contact_path,
            title: 'Contact'
        },
        {
            url: blogs_path,
            title: 'Blog'
        },
        {
            url: portfolios_path,
            title: 'Portfolio'
        },
        {
          url: tech_news_path,
          title: 'Tech News'
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Attention!", sticky: false)
  end
end
