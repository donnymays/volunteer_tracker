<h1>Update <%= @project.name() %></h1>

<form action="/projects/<%=@project.id %>" method="post">
<input name="_method" type="hidden" value="patch">
  <div class="form-group">    
    <label for="title"> Edit Project:</label>
    <input id="title" name="title" class="form-control" type="text" required>
  </div>
  <button type="submit" class="btn btn-primary"> Update</button> 
</form>  
  
<br><br>

<form action="/projects/<%= @project.id() %>" method="post">
  <input name="_method" type="hidden" value="delete">

  <button type="submit">Delete Project</button>
</form>