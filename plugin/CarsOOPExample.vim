" These functions are my try to make Object Oriented Programing style in vim
" How to make a constructor
" 	Make a constructor like this
"
" 	function! Colors(this,arg1,arg2...argn)
"
" 		call OOP:Initialize(a:this)
" 		call OOP:Var("#member1#",85)
" 		call OOP:Var("#member2#",85)
"		.
"       	.
"       	.
" 		call OOP:Var("#membern#",85)
"		....Extra initalization here...
"		return this
"
"	endf
"How to make a member function
"	for example we can add a member function by putting this
"
"	function! Colors:ListColors(this,arg1,arg2...argn)
"
"		do anything here or you can set a member varible like this
"	Note: Remember the basic structure of OOP, you need to pass the this
"	argument on any member function either the constructor.
"
"		let a:this=OOP:Set(instance1,"#arg1#","blue")
"
"		...Extra things...
"
"		exec OPP:Return(a:this,"this is a value returned to ret var")
"
"		Note: Here is an implementation of a return function because
"		we need to execute some extra code, you need to pass te return
"		value here, after de function you can recover it by the
"		OOP:Get function like a member variable with #ret# name
"	endf
" 	To call the method above you have to use the next function
"
"	let instancename=OOP:Method(instancename,"ListColors",1,2,...argn)
"
"	Use the next example to guide yourself
"	
"

"***********************A CARS EXAMPLE****************************

"	This function creates a construction for Cars class
"	Note: Each class function needs the this variable this is the only way
"	to comunicate betwen methods and instances every OOP language use this
"	variable but hidden.
function! Cars(this,color,wheels,type)
	" Here we have to initialize the object like this:
	call OOP:Initialize(a:this)
	" And then we want to add member variable that holds the cars
	" properties The function above automatically adds the ret variable by
	" itself, you don't need to add it here.
	"
	" Initializing the Cars->Color variable 
	" and then Cars->wheels
	" and then Cars->type
	call OOP:Var("#Color#",a:color)
	call OOP:Var("#Wheels#",a:wheels)
	call OOP:Var("#Type#",a:type)
	echo " A new instance of class Cars has been created"
endfunction


"	Now we have to create a list function that belongs to the Cars class this function will prints a list of the Cars instance Properties
"
"
function! Cars:List(this)
	"Initializing "this" variable , this thing is only
	"necesary if we need to call a Set Method inside a member function
	let this=a:this
	"Printing the members before a modification
	echo "this instance has the following values before changing Color: "
	echo OOP:Get(this,"#Color#")
	echo OOP:Get(this,"#Wheels#")
	echo OOP:Get(this,"#Type#")
	"let's do a modification
	let this=OOP:Set(this,"#Color#","blue")
	"let's print the changed values
	echo "this instance has the following values after changing Color: "
	echo OOP:Get(this,"#Color#")
	echo OOP:Get(this,"#Wheels#")
	echo OOP:Get(this,"#Type#")
	"this function is used as a return function
	exec OPP:Return(this,"The list function was executed")
endf

"	And finally this is the program that use all the things we have done
function! Program()
	"	Creating the new car object of Cars Class and initializing
	"	each variable
	let myfirstcar=OOP:NewObject("Cars","black",4,"truck")
	"	now  we cal the list member function of myfirstcar
	let myfirstcar=OOP:Method(myfirstcar,"List")
	echo "PRINTING TO TEST THE CHANGES"
	echo OOP:Get(myfirstcar,"#Color#")
	echo OOP:Get(myfirstcar,"#Wheels#")
	echo OOP:Get(myfirstcar,"#Type#")

endf




