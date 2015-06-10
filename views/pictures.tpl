<{include 'header.tpl'}>
<br />
<br />
<div class="container_wrapper">
	<div style="margin:50px;"></div>
	<div class="container bs-docs-container" style="width:1320px">
		<div class="row" style="margin-bottom:100px">
			<div class="page-header"><h1>留住精彩瞬间 -- 龙泉相册</h1></div>
			<center>
				<p><h1 style="color:#0047DD;margin-top:80px">图片查询</h1></p>
			</center>
			<form class="navbar-form navbar-left" role="search" id="picture" method="get" action="pictures.php">
				<div class="input-group" style="margin-top:10px;margin-bottom:10px;">
					<span class="input-group-addon">图片ID</span>
					<input type="text" class="form-control" name="image_id" id="image_id" placeholder="Picture-ID" style="width:300px;"/>
					<span class="input-group-addon">图片路径</span>
					<input type="text" class="form-control" name="path" id="path" placeholder="Picture-Path" style="width:300px;"/>
					<span class="input-group-addon">MD5</span>
					<input type="text" class="form-control" name="md5" id="md5" placeholder="Picture-MD5" style="width:300px;"/>
					<input type="hidden" name="opt_type" id="opt_type" value="search"/>
				</div>
				<div class="input-group" style="margin-top:10px;margin-bottom:10px;">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						Category <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<{foreach item=cat from=$category_list}>
							<li><a href="javascript:void(0)" onclick="change_category('<{$cat}>', 'category')"><{$cat}></a></li>
							<{/foreach}>
						</ul>
					<input value="<{if $category!=''}><{$category}><{else}>all<{/if}>" type="text" class="form-control" id="category" name="category" style="width:235px;" readonly="readonly"/>
					<span class="input-group-addon">插入时间（起始）</span>
					<div class="input-group date form_datetime">
						<input class="form-control" width="20px" type="text" id="start_time" name="start_time" value="<{if $start_time!=''}><{$start_time}><{else}>2014-01-01 00:00:00<{/if}>">
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					</div>
					<span class="input-group-addon">插入时间（终止）</span>
					<div class="input-group date form_datetime">
						<input class="form-control" width="20px" id="end_time" name="end_time" type="text" value="<{if $start_time!=''}><{$end_time}><{/if}>">
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					</div>
				</div>
				<p><button class="btn btn-primary btn-lg" type="submit" role="button">检&nbsp;&nbsp;索</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添&nbsp;&nbsp;加</button></p>
			</form>
			<center style="margin-top: 230px; float:none">
				<p><h1 style="color:#0047DD;margin-top:120px">图片列表</h1></p>
			</center>
			<h3>图片总数: <{$count}></h3>
			<center>
				<table class="stdtable" style="font-weight:bold; word-wrap:break-word; overflow:normal;">
					<caption style="background-color:#BFEFFF; font-weight:bold; font-size:24px">PICTURES</caption>
					<tr style="background-color:#BFEFFF;">
						<td width="7%" valign="middle" align="center" valign="middle">
							ID
						</td>
						<td width="15%" valign="middle" align="center" valign="middle">
							PICTURE
						</td>
						<td width="10%" valign="middle" align="center" valign="middle">
							CATEGORY
						</td>
						<td width="30" valign="middle" align="center" valign="middle">
							PATH
						</td>
						<td width="20%" valign="middle" align="center" valign="middle">
							INSERT_TIME
						</td>
					</tr>
					<{foreach item=info from=$infos name=image}>
					<tr>
						<td valign="middle" style="padding-top:50px;"align="center"><{$info.image_id}></td>
						<td valign="middle" align="center"><a href="<{$info.path}>" target="_blank"><img class="img-thumbnail" alt="100x100" style="margin-right:10px; margin-left:10px; margin-top:10px; margin-bottom:10px; height:100px; width:100px;" src="<{$info.path}>" title="<{$info.path}>"/></a></td>
						<td valign="middle" style="padding-top:50px;"align="center">
							<{$info.category}>
						</td>
						<td valign="middle" style="padding-top:50px;"align="center" valign="middle">
							<{$info.path}>
						</td>
						<td valign="middle" style="padding-top:50px;"align="center" valign="middle">
							<{$info.inserttime}>
						</td>
					</tr>
					<{/foreach}>
				</table>
				<ul class="pagination">
					<{if $first != ''}>
					<li><a href="?page=<{$first}>&<{$param}>" class="first">&laquo;</a></li>
					<li><a href="?page=<{$pre}>&<{$param}>">&lt;</a></li>
					<{/if}>
					<{foreach item=pagenum from=$list}>
					<{if $page==$pagenum}>
					<li class="active"><a href="javascript:void(0)" hidefocus=""><{$pagenum}></a></li>
					<{else}>
					<li><a href="?page=<{$pagenum}>&<{$param}>" hidefocus=""><{$pagenum}></a></li>
					<{/if}>
					<{/foreach}>
					<{if $end != ''}>
					<li><a href="?page=<{$last}>&<{$param}>" class="next">&gt;</a></li>
					<li><a href="?page=<{$end}>&<{$param}>" class="last">&raquo;</a></li>
					<{/if}>
				</ul>
			</center>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="margin:300px auto;">
		<form id="pic_form" action="/html/pictures.php" method="post" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><strong>图片添加或替换</strong></h4>
				</div>
				<div class="modal-body">
					<div class="input-group" style="margin-top:10px;margin-bottom:10px;">
						<span class="input-group-addon" style="width:10px;">图片ID</span>
						<input type="text" class="form-control" name="insert_id" id="insert_id" placeholder="Picture-ID" style="width:300px;"/>&nbsp;&nbsp;
					</div>
					<div class="input-group" style="margin-top:10px;margin-bottom:10px;">
						<span class="input-group-addon" style="width:10px;">文件名</span>
						<input type="file" id="file" name="file" onchange="if ($('#file').val() != '') {$('#file_input').val($('#file').val());}" value="" style="display:none"/>
						<input type="text" id="opt_type" name="opt_type" value="insert" style="display:none"/>
						<input type="text" id="file_input" class="form-control" style="width:200px;" readonly="readonly" value=""/>
						<button type="button" class="btn btn-primary" onclick="$('#file').click()" style="float:right; margin-left:10px">浏览</button>
					</div>
					<div class="input-group" style="margin-top:10px;margin-bottom:10px;">
							<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							Category <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<{foreach item=cat from=$category_list}>
								<{if $cat!='all'}>
								<li><a href="javascript:void(0)" onclick="change_category('<{$cat}>', 'insert_category')"><{$cat}></a></li>
								<{/if}>
								<{/foreach}>
							</ul>
						<input value="article" type="text" class="form-control" id="insert_category" name="insert_category" style="width:200px;" readonly="readonly"/>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="insert_image()">添加或替换</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
if (document.getElementById('end_time').value == '')
{
	var mydate = new Date();
	var time_str = mydate.getFullYear();
	var month = mydate.getMonth()+1;
	if (month < 10)
		month = '0' + month;
	var day = mydate.getDate();
	if (day < 10)
		day = '0' + day;
	var hour = mydate.getHours();
	if (hour < 10)
		hour = '0' + hour;
	var minute = mydate.getMinutes();
	if (minute < 10)
		minute = '0' + hour;
	var second = mydate.getSeconds();
	if (second < 10)
		second = '0' + second;
	time_str += '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	document.getElementById('end_time').value = time_str;
}

$(".form_datetime").datetimepicker
(
	{
		format: "yyyy-mm-dd hh:ii:ss",
		todayHighlight: true,
		initialDate: new Date(),
		autoclose: true,
		todayBtn: true,
		pickerPosition: "bottom-left"
	}
);

function change_category (category, id)
{
	document.getElementById(id).value = category;
	return false;
}

function insert_image()
{
	$('#pic_form').submit();
}
</script>
<{include 'footer.tpl'}>
