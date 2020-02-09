<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8" />
    <title>Create New Module</title>
</head>
<body>
<div align="center">
    <h1>Create New Module</h1>
    <br />
    <form action="#" th:object="${module}"
          method="post">

        <table border="0" cellpadding="10">
            <tr>
                <td>Module Name:</td>
                <td><input name="name" ></td>
            </tr>
            <tr>
                <td>Type:</td>
                <td>
                    <input name="type" value='${module.type}' readonly="readonly" class="required">
                </td>
            </tr>
            <tr>
                <td>Parent ID:</td>
                <td>
                    <input name="parentId" value='${module.parentId}' readonly="readonly" class="required">
                </td>
            </tr>
            <tr>
                <td colspan="2"><button type="submit">Save</button> </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>