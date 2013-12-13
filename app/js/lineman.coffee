$ ->
  sidebar = new Sidebar().init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    $('html, body').animate({
        scrollTop: $($(e.target).attr('href')).offset().top
    }, 500);
    sidebar.close()
