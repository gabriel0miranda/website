<div class="topbar">
<i>Um lápis solitário repousa na mesa, ele aguarda o fim inevitável de todo lápis: escrever até morrer.<i>
</div>

<div class="content">
<p>Aqui eu guardo coisas que transbordam meus pensamentos mas não possuem muita utilidade artística ou prática.</p>

<p>Pode chamar de filosofia se quiser.</p>
<hr>
{{
	-- Sort posts by file creation time
	local times = {}
	for name, post in pairs(content.escrivaninha.posts) do
		table.insert(times, name)
	end
	table.sort(times, function(a, b)
		return content.escrivaninha.posts[a].accessed_time > content.escrivaninha.posts[b].accessed_time
	end)
	
	local output = ""
	for _, name in pairs(times) do
		
		local post = content.escrivaninha.posts[name]
		
	-- ### [<POST TITLE>](<URL>)\n<POST TEXT FOLLOWING POST TITLE UP TO 144 CHARS>
		output = output .. "## ["..post.title.."](./escrivaninha/posts/"..name..".html)\n"..post.text:match("#.-\n(.*)"):sub(1, 256).."\n\n"
		
	end
	
	return output
}}
</div>
