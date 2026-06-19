local M = {}

-- Shallow merge of one or more tables. Later tables win on key collision.
-- Logs a warning to the WezTerm debug log if a key is overwritten.
function M.merge(...)
	local result = {}

	for _, tbl in ipairs({ ... }) do
		for k, v in pairs(tbl) do
			if result[k] ~= nil then
				print("[table.merge] collision on key: " .. tostring(k))
			end
			result[k] = v
		end
	end

	return result
end

return M
