var check=1;
function openNav() {
	if(check===1)
		{
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	  check=0;
		}
	else
		{
		document.getElementById("mySidebar").style.width = "0";
		  document.getElementById("main").style.marginLeft= "0";
		  check=1;
		}
	  
	  
	}
