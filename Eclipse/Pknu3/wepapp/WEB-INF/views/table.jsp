<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상품관리</title>
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="https://www.jeasyui.com/easyui/datagrid-bufferview.js"></script>
</head>
<style>
#mainbod{
   margin : auto;
}
</style>
<body>

<div id="mainbod">
    <div style="margin-bottom:10px">  
        <select onchange="load(this.value)">  
            <option value="remote">최근등록순</option>  
            <option value="local">오래된순</option>  
        </select>
        
        <select onchange="load(this.value)">  
            <option value="remote">가격별 정렬</option>  
            <option value="remote">높은가격순</option>  
            <option value="local">낮은가격순</option>  
        </select>  
        
        <a href="/SideBar" >사이드바</a>
    </div>  
    <table id="tt" title="DataGrid - BufferView" style="width:700px;height:300px" data-options="
                view:bufferview,rownumbers:true,singleSelect:true,
                url:'datagrid27_getdata.php?total=800',
                autoRowHeight:false,pageSize:50">
        <thead>
            <tr>
                <th field="inv" width="80">회원권</th>
                <th field="date" width="100">카테고리</th>
                <th field="name" width="80">회원권명</th>
                <th field="amount" width="80" align="right">사용기한</th>
                <th field="price" width="80" align="right">세션</th>
                <th field="cost" width="100" align="right">가격</th>
                <th field="note" width="110">--</th>
            </tr>
        </thead>
    </table>
</div>
    <script type="text/javascript">
        $(function(){
            $('#tt').datagrid();
        });
        function loadLocal(){
            var rows = [];
            for(var i=1; i<=800; i++){
                var amount = Math.floor(Math.random()*1000);
                var price = Math.floor(Math.random()*1000);
                rows.push({
                    inv: 'Inv No '+i,
                    date: $.fn.datebox.defaults.formatter(new Date()),
                    name: 'Name '+i,
                    amount: amount,
                    price: price,
                    cost: amount*price,
                    note: 'Note '+i
                });
            }
            $('#tt').datagrid('loadData', rows);
        }
        function load(mode){
            if (mode == 'local'){
                loadLocal();
            } else {
                $('#tt').datagrid({
                    url:'datagrid27_getdata.php?total=800'
                });
            }
        }
    </script>
    <style type="text/css">
        .datagrid-header-rownumber,.datagrid-cell-rownumber{
            width:35px;
        }
    </style>
</body>
</html>