$ ->
  sidebar = new Sidebar().init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    slug = $(e.target).attr('href')
    $('html, body').animate({
        scrollTop: $(slug).offset().top
    }, 500);
    sidebar.close()
