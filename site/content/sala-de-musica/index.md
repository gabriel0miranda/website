<div class="topbar">
<i>A acústica desta sala é estonteante, sua própria respiração vira música.<i>
</div>

<div class="content">
<p>Esta sala guarda meus pensamentos sobre música.</p>

<p>Os escritos são majoritáriamente sobre Black Metal, mas o barulho deve parar em algum momento.</p>
<hr>
{{
	-- Sort posts by file creation time
	local times = {}
	for name, post in pairs(content.sala-de-musica.posts) do
		table.insert(times, name)
	end
	table.sort(times, function(a, b)
		return content.sala-de-musica.posts[a].accessed_time > content.sala-de-musica.posts[b].accessed_time
	end)
	
	local output = ""
	for _, name in pairs(times) do
		
		local post = content.sala-de-musica.posts[name]
		
	-- ### [<POST TITLE>](<URL>)\n<POST TEXT FOLLOWING POST TITLE UP TO 144 CHARS>
		output = output .. "## ["..post.title.."](./sala-de-musica/posts/"..name..".html)\n"..post.text:match("#.-\n(.*)"):sub(1, 256).."\n\n"
		
	end
	
	return output
}}
</div>
