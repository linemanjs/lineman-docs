$ ->
  sidebar = new Sidebar({ body : '.container'}).init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    slug = $(e.target).attr('href')
    $('html, body').animate({
        scrollTop: $(slug).offset().top
    }, 500);
    window.location.hash = slug
    sidebar.close()

  offset = 250
  if window.scrollY > offset 
    $('#header').addClass('fixed')
    offset = 30

  $('#header').headroom({
        tolerance: 2,
        offset : offset,
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
