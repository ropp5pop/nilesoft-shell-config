theme
{
  name = 'modern'
  view = view.compact
  dark = auto

  font.size = 12 * $finalScale
  font.name = if(font.exists('Roboto Medium'),'Roboto Medium','Segoe UI')

  layout.width = 144 * $finalScale
  image.align = 2

  background
  {
    color   = #141a22
    opacity = auto
    effect  = 0
  }

  item
  {
    text.normal  = #d0c4bc
    text.select  = #fff0e6
    back.select  = #222d3b
    border.select= #567397
    padding = [4,2]
    margin  = 1
  }

  border
  {
    size = 1
    color = #404558
    radius = 0
  }

  separator.color = #404558
  separator.size  = 1
}