<div class="topbar">
<i>Madeira, vidro ou metal, tudo vem da terra antes de vir do homem.<i>
</div>

<div class="content">
<p>Deixo aqui o mundo transformado pelas minhas mãos.</p>

<p>A magia está no processo, o resultado é só o fim.</p>
<hr>
{{
	-- Sort posts by file creation time
	local times = {}
	for name, post in pairs(content.oficina.posts) do
		table.insert(times, name)
	end
	table.sort(times, function(a, b)
		return content.oficina.posts[a].accessed_time > content.oficina.posts[b].accessed_time
	end)
	
	local output = ""
	for _, name in pairs(times) do
		
		local post = content.oficina.posts[name]
		
	-- ### [<POST TITLE>](<URL>)\n<POST TEXT FOLLOWING POST TITLE UP TO 144 CHARS>
		output = output .. "## ["..post.title.."](./oficina/posts/"..name..".html)\n"..post.text:match("#.-\n(.*)"):sub(1, 256).."\n\n"
		
	end
	
	return output
}}
</div>
