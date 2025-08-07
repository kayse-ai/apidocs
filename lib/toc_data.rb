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
  headers.select {|header| not(['workspace', 'users', 'source' ,'dataset', 'task', 'board', 'embed'].include? header[:id].to_s)}
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
  headers.select {|header| ['workspace', 'users', 'source', 'dataset', 'task', 'board', 'embed'].include? header[:id].to_s}
end

HTTP_METHOD_PAIRS = Hash[
  "Create a new workspace" => "POST",
  "Get workspaces" => "GET",
  "Edit workspace" => "PUT",
  "Delete workspace" => "DELETE",
  "Fetch existing &amp; invited workspace users" => "GET",
  "Get all connected sources" => "GET",
  "Delete an existing source" => "DELETE",
  "Connect a new Snowflake connector" => "POST",
  "Edit an Existing Snowflake connector" => "PATCH",
  "Import data using newly connected Snowflake" => "POST",
  "Snowflake - Sync Data (Manually)" => "POST",
  "Connect a new Google BigQuery connector" => "POST",
  "Edit an Existing Google BigQuery connector" => "PATCH",
  "Import data using newly connected Google BigQuery" => "POST",
  "Google BigQuery - Sync Data (Manually)" => "POST",
  "Upload a Dataset" => "POST",
  "Update a Dataset" => "PUT",
  "Fetch Datasets" => "GET",
  "Fetch Status" => "GET",
  "Create Board" => "POST",
  "Chart Object" => "",
  "Edit Board" => "PUT",
  "Fetch Boards" => "GET",
  "Delete Board" => "DELETE",
  "Invite member to workspace" => "POST",
  "Delete existing or invited workspace user" => "DELETE",
  "Generate an auth token" => "POST",
  "Invite a new member to workspace" => "POST"
]

def get_http_method(heading)
  if HTTP_METHOD_PAIRS.key?(heading.to_s)
    HTTP_METHOD_PAIRS[heading.to_s].to_s
  end
end
