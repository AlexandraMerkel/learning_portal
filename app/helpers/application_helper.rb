module ApplicationHelper
  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end
  
  def ellipsisize(str, minimum_length = 30, edge_length = 10)
    return str if str.length < minimum_length or str.length <= edge_length * 2 
    edge = '.' * edge_length    
    mid_length = str.length - edge_length * 2
    str.gsub(/(#{edge}).{#{mid_length},}(#{edge})/, '\1...\2')
  end
end
