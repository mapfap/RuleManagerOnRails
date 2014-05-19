json.array!(@changelogs) do |changelog|
  json.extract! changelog, :id, :rule, :user, :new_if, :new_then, :new_tag, :timestamp, :ip
  json.url changelog_url(changelog, format: :json)
end
