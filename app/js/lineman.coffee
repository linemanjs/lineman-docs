$ ->
  bigOffset = 250
  smallOffset = 30
  offset = bigOffset
  slideOutClass = 'slideOutUpBig'
  lastScrollTop = 0
  delta = 5
  sidebar = new Sidebar({ body : '.container'}).init()

  $('nav').find('a[href^=#]').on 'click', (e) ->
    e.preventDefault()
    slug = $(e.target).attr('href')
    $('html, body').animate({
        scrollTop: $(slug).offset().top
    }, 500);
    window.location.hash = slug
    sidebar.close()
  
  # If we reload the page at other point than x,y = 0,0
  if window.scrollY > bigOffset 
    $('#header').addClass('fixed')
    offset = smallOffset

  # Headroom plugin
  $('#header').headroom({
        tolerance: 2,
        offset : offset,
        classes: {
          initial: "animated",
          pinned: "slideInDown",
          unpinned: slideOutClass
        },
        onUnpin : () -> if !$(this.elem).hasClass('fixed')
                          console.log('e')
                          # this.classes.unpinned = slideOutClass

  })

  # Better animation for green big header
  $('#header').on 'webkitAnimationEnd oAnimationend oAnimationEnd msAnimationEnd animationend', (e) ->
    if !$('#header').hasClass('fixed')
      $.when($('#header').addClass('fixed')).then -> window.scrollTo(0,0)      
      offset = smallOffset
      slideOutClass = 'slideOutUp'

  $('#header #lineman-logo').bind 'click', (e) ->
    $('#header').removeClass('fixed')
    window.scrollTo(0,0)
    offset = bigOffset
    slideOutClass = 'slideOutUpBig'