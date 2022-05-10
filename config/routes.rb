Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_page#home"
    get  "static_page/help"
    get  "static_page/about"
  end
end
