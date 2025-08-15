require 'nokogiri'

def toc_data(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  # get a flat list of headers
  headers = []
  html_doc.css('h1, h2, h3').each do |header|
    headers.push({
      id: header.attribute('id').to_s,
      content: header.children,
      title: header.children.to_s.gsub(/<[^>]*>/, ''),
      level: header.name[1].to_i,
      children: []
    })
  end

  [3,2].each do |header_level|
    header_to_nest = nil
    headers = headers.reject do |header|
      if header[:level] == header_level
        header_to_nest[:children].push header if header_to_nest
        true
      else
        header_to_nest = header if header[:level] < header_level
        false
      end
    end
  end
  headers.select {|header| not(['cases', "clients"].include? header[:id].to_s)}
end

def resources_data(page_content)
  html_doc = Nokogiri::HTML::DocumentFragment.parse(page_content)

  headers = []
  html_doc.css('h1, h2, h3').each do |header|
    headers.push({
      id: header.attribute('id').to_s,
      content: header.children,
      title: header.children.to_s.gsub(/<[^>]*>/, ''),
      level: header.name[1].to_i,
      children: []
    })
  end

  [3,2].each do |header_level|
    header_to_nest = nil
    headers = headers.reject do |header|
      if header[:level] == header_level
        header_to_nest[:children].push header if header_to_nest
        true
      else
        header_to_nest = header if header[:level] < header_level
        false
      end
    end
  end
  headers.select {|header| ['cases', 'clients'].include? header[:id].to_s}
end

HTTP_METHOD_PAIRS = Hash[
  "Create a new case" => "POST",
  "Get a case by ID" => "GET",
  "Update a case" => "PUT",
  "Delete a case" => "DELETE",
  "Create a new client" => "POST",
  "Get a client by ID" => "GET",
  "Update a client" => "PUT",
  "Delete a client" => "DELETE"
]

def get_http_method(heading)
  if HTTP_METHOD_PAIRS.key?(heading.to_s)
    HTTP_METHOD_PAIRS[heading.to_s].to_s
  end
end
