function! OOP:NewObject(structure,...)
	let arguments=""
	let index=1
	let this=a:structure
	while(index<=a:0)
		let tb="\"".a:{index}."\""   
		let arguments=arguments.tb."@"
		let index=index+1
	endwhile
	let arguments=substitute(arguments,"@\\{-1}",",","g")
	let arguments=substitute(arguments,",$","","g")
	execute "let result=".a:structure."(this,".arguments.")"
	return g:OOP
endf
function! OOP:Var(var,value)
	let g:OOP=g:OOP."@".a:var."@".a:value
endfunction
function! OOP:Initialize(this)
	let g:OOP=a:this."@#ret#@0"
	let g:OOP_NULL="NULL"
endfunction

function! OOP:Method(instance,fname,...)

	let arguments=""
	let index=1
	let this=a:instance
	while(index<=a:0)
		let tb=a:{index}
		let arguments=arguments.tb."@"
		let index=index+1
	endwhile
	let arguments=substitute(arguments,"@\\{-1}\\<",",","g")
	let arguments=substitute(arguments,"@","","g")

	exec "let result=".matchstr(a:instance,"\\w\\{-}\\>").":".a:fname."(\"".a:instance."\",".arguments.")"
	return result
endfunction
function! OOP:Get(instance,var)
	let startfrom=match(a:instance,a:var)+strlen(a:var)
	return substitute(matchstr(a:instance,"@.\\{-}\\(@\\|$\\)",startfrom),"@","","g")

endfunction
function! OOP:Set(instance,var,value)
	let startfrom=match(a:instance,a:var,0)+strlen(a:var)
	let thenfrom=startfrom+strlen(matchstr(a:instance,"@.\\{-}\\(@\\|$\\)",startfrom))
	return	strpart(a:instance,0,startfrom)."@".a:value."@".strpart(a:instance,thenfrom)

endfunction
function! OPP:Return(this,value)
	let this=OOP:Set(a:this,"#ret#",a:value)
	return "return \"".this."\""
endf
