<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_35#></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">

<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/client_function.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script type="text/javascript" src="/help_b.js"></script>
<script>
var $j = jQuery.noConflict();

$j(document).ready(function() {
	
	init_itoggle('wireguard_enable');

});

</script>
<script>

<% login_state_hook(); %>


function initial(){
	show_banner(2);
	show_menu(5,17,0);
	showmenu();
	show_footer();

}
function showmenu(){
showhide_div('allink', found_app_aliddns());
showhide_div('zelink', found_app_zerotier());
showhide_div('ddlink', found_app_ddnsto());
}

function applyRule(){
//	if(validForm()){
		showLoading();
		
		document.form.action_mode.value = " Restart ";
		document.form.current_page.value = "/Advanced_wireguard.asp";
		document.form.next_page.value = "";
		
		document.form.submit();
//	}
}

function done_validating(action){
	refreshpage();
}



</script>
</head>

<body onload="initial();" onunLoad="return unload_body();">

<div class="wrapper">
	<div class="container-fluid" style="padding-right: 0px">
		<div class="row-fluid">
			<div class="span3"><center><div id="logo"></div></center></div>
			<div class="span9" >
				<div id="TopBanner"></div>
			</div>
		</div>
	</div>

	<div id="Loading" class="popup_bg"></div>

	<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

	<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">

	<input type="hidden" name="current_page" value="Advanced_wireguard.asp">
	<input type="hidden" name="next_page" value="">
	<input type="hidden" name="next_host" value="">
	<input type="hidden" name="sid_list" value="WIREGUARD;">
	<input type="hidden" name="group_id" value="">
	<input type="hidden" name="action_mode" value="">
	<input type="hidden" name="action_script" value="">


	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<!--Sidebar content-->
				<!--=====Beginning of Main Menu=====-->
				<div class="well sidebar-nav side_nav" style="padding: 0px;">
					<ul id="mainMenu" class="clearfix"></ul>
					<ul class="clearfix">
						<li>
							<div id="subMenu" class="accordion"></div>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				<!--Body content-->
				<div class="row-fluid">
					<div class="span12">
						<div class="box well grad_colour_dark_blue">
							<h2 class="box_head round_top"><#menu5_30#> - <#menu5_35#></h2>
							<div class="round_bottom">
							<div>
                            <ul class="nav nav-tabs" style="margin-bottom: 10px;">
								<li id="allink" style="display:none">
                                    <a href="Advanced_aliddns.asp"><#menu5_23_1#></a>
                                </li>
								<li id="zelink" style="display:none">
                                    <a href="Advanced_zerotier.asp"><#menu5_32_1#></a>
                                </li>
								<li id="ddlink" style="display:none">
                                    <a href="Advanced_ddnsto.asp"><#menu5_34_1#></a>
                                </li>
								<li class="active">
                                    <a href="Advanced_wireguard.asp"><#menu5_35_1#></a>
                                </li>
                            </ul>
                        </div>
								<div class="row-fluid">
									<div id="tabMenu" class="submenuBlock"></div>
									<div class="alert alert-info" style="margin: 10px;">
									<p>WireGuard 是一个易于配置、快速且安全的开源VPN<br>
									</p>
									</div>



									<table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">


										<tr>
										<th width="30%" style="border-top: 0 none;">启用wireguard客户端</th>
											<td style="border-top: 0 none;">
													<div class="main_itoggle">
													<div id="wireguard_enable_on_of">
														<input type="checkbox" id="wireguard_enable_fake" <% nvram_match_x("", "wireguard_enable", "1", "value=1 checked"); %><% nvram_match_x("", "wireguard_enable", "0", "value=0"); %>  />
													</div>
												</div>
												<div style="position: absolute; margin-left: -10000px;">
													<input type="radio" value="1" name="wireguard_enable" id="wireguard_enable_1" class="input" value="1" <% nvram_match_x("", "wireguard_enable", "1", "checked"); %> /><#checkbox_Yes#>
													<input type="radio" value="0" name="wireguard_enable" id="wireguard_enable_0" class="input" value="0" <% nvram_match_x("", "wireguard_enable", "0", "checked"); %> /><#checkbox_No#>
												</div>
											</td>

										</tr>
                                        <tr id="row_post_wan_script">
											<td colspan="2">
												<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script2')"><span>确保配置文件能被wg-quick正确读取</span></a>
												<div id="script2">
													<textarea rows="18" wrap="off" spellcheck="false" maxlength="314571" class="span12" name="scripts.wg0.conf" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.wg0.conf",""); %></textarea>
												</div>
											</td>
										</tr>

										<tr>
											<td colspan="4" style="border-top: 0 none;">
												<br />
												<center><input class="btn btn-primary" style="width: 219px" type="button" value="<#CTL_apply#>" onclick="applyRule()" /></center>
											</td>
										</tr>
</table>

										
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	</form>

	<div id="footer"></div>
</div>
</body>
</html>

