# Decorator base class
class TextDecorator < TextComponent
  def initialize(component)
    @component = component
  end

  def render
    @component.render
  end
end

# Concrete decorator adding borders to the text component
class BorderDecorator < TextDecorator
  def render
    add_border(super)
  end

  def add_border(text)
    "Bordered: #{text}"
  end
end

# Concrete decorator adding scrollbars to the text component
class ScrollbarDecorator < TextDecorator
  def render
    add_scrollbars(super)
  end

  def add_scrollbars(text)
    "With Scrollbars: #{text}"
  end
end

# Concrete decorator adding different text style to the text component
class TextStyleDecorator < TextDecorator
  def render
    add_text_style(super)
  end

  def add_text_style(text)
    "Styled Text: #{text}"
  end
end


# Here, super is used inside the BorderDecorator class's render method. This render method overrides the render method of its superclass (TextDecorator), which itself overrides the render method of TextComponent.
# When super is called within the render method of BorderDecorator, it calls the render method of the superclass (TextDecorator), passing along any arguments that were passed to the current method.
# In this case, super is invoking the render method of TextDecorator with the same arguments that were passed to BorderDecorator's render method.
# So, in the context of the Decorator pattern, super is used to delegate the call to the wrapped component's render method, allowing the decorator to add its functionality before or after invoking the wrapped component's behavior.