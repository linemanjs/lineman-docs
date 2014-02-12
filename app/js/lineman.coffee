$ ->
  sidebar = new Sidebar({ body : '.container'}).init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    $('html, .container').animate({
        scrollTop: $($(e.target).attr('href')).offset().top
    }, 500);
    sidebar.close()

  $('#header').headroom({
        tolerance: 10,
        offset : 250,
        classes: {
          initial: "animated",
          pinned: "slideInDown",
          unpinned: "slideOutUp"
        },
        onUnpin : () -> if !$(this.elem).hasClass('fixed')
                          $(this.elem).addClass('fixed')
                          window.scrollTo(0,0)
                          this.offset = 30
    })