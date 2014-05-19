json.array!(@rules) do |rule|
  json.extract! rule, :id, :if, :then, :tag
  json.url rule_url(rule, format: :json)
end
