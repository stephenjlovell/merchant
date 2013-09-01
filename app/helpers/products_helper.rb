module ProductsHelper

  def print_stock(stock)
    if stock > 0
      # <span class="in\_stock"\>In Stock (##)\</span\>
      content_tag(:span,"In Stock (#{stock})", class: "in_stock" )
    else
      # '<span class="out_stock">Out of Stock</span>''
      content_tag(:span, "Out of Stock", class: "out_stock")
    end
  end

end
