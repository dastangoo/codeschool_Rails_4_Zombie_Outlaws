# Dead Man Walking. Strong Parameters, Filters, and Remote Forms
```html
<form action='/users' method="post">
  <p>
    <input type="name" name="name" id="name">
  </p>
  <p>
    <input type="submit" name="commit" value="save">
    <!-- Malicious users could try and submit additional fields using DevTools and Inspector -->
    <input type="hidden" name="admin" value="1">
  </p>
</form>


```