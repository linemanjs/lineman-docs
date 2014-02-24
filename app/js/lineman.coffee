$ ->
  sidebar = new Sidebar().init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    slug = $(e.target).attr('href')
    return unless ($slug = $(slug)).length > 0

    e.preventDefault()
    $('html, body').animate({
        scrollTop: $slug.offset().top
    }, 500);
    window.location.hash = slug
    sidebar.close()
