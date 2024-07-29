<%@page import="dto.NominationCollectionDto"%>
<%@page import="dao.NominationCollectionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.NoticeBarDto"%>
<%@page import="dao.NoticeBarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int nb_idx = 1;
	try {
		nb_idx = Integer.parseInt(request.getParameter("nb_idx"));
	} catch (Exception e) { }
	
	NoticeBarDao nbDao = new NoticeBarDao();
	ArrayList<NoticeBarDto> nbDto = nbDao.noticebar(nb_idx);
	
	int nc_idx = 1;
	
	NominationCollectionDao ncDao = new NominationCollectionDao();
	NominationCollectionDto ncDto = new NominationCollectionDto();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Customized</title>
	<link rel= "stylesheet" href="css/ShopifyCustomized.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script> 
	// 버튼 클릭 시 다음 공지표시줄 내용을 띄움
		$(document).ready(function() {
        var index = 0;
        var contents = $('.content');
        
        $('#sunseo_up').click(function() {
            contents.hide(); // 모든 내용을 숨김
            index++;
            if (index >= contents.length) {
                index = 0;
            }
            contents.eq(index).show(); // 현재 인덱스의 내용을 표시
            
        });
        $('#sunseo_down').click(function() {
            contents.hide(); // 모든 내용을 숨김
            index--;
            if (index < 0) {
                index = contents.length - 1;
            }
            contents.eq(index).show(); // 현재 인덱스의 내용을 표시
            
        });
        $(document).ready(function() {
            $('#add_notice').click(function() {
                var nb_idx = 1; 
                
                $.ajax({
                    url: 'NbAddServlet',
                    type: 'POST',
                    data: {
                        nb_idx: nb_idx
                    },
                    success: function(response) {
                    },
                    error: function(xhr, status, error) {
                    }
                });
            });
        });
    });
	</script>
</head>
<body>
	<div id= "header">
		<div>
			<div>
				<div><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 21 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill="#4A4A4A" fill-rule="evenodd" d="M10.177 3H14.83c.535 0 .98 0 1.345.03.38.03.736.098 1.073.27a2.75 2.75 0 0 1 1.202 1.202c.172.337.24.693.27 1.073.03.365.03.81.03 1.345v5.91c0 .535 0 .98-.03 1.345-.03.38-.098.736-.27 1.073a2.75 2.75 0 0 1-1.201 1.202c-.338.172-.694.24-1.074.27-.365.03-.81.03-1.345.03H9.963c-.196 0-.347 0-.483-.013a2.75 2.75 0 0 1-2.467-2.467C7 14.134 7 13.983 7 13.787v-.037a.75.75 0 0 1 1.5 0c0 .25 0 .32.006.373a1.25 1.25 0 0 0 1.121 1.121c.052.005.123.006.373.006h4.8c.572 0 .957 0 1.252-.025.288-.023.425-.065.515-.111a1.25 1.25 0 0 0 .547-.546c.046-.091.088-.228.111-.515.024-.296.025-.68.025-1.253V6.95c0-.572 0-.957-.025-1.252-.023-.288-.065-.425-.111-.515a1.25 1.25 0 0 0-.547-.547l.339-.663-.338.663c-.091-.046-.228-.088-.516-.111-.295-.024-.68-.025-1.252-.025h-4.55c-.5 0-.641.004-.744.024a1.25 1.25 0 0 0-.982.982c-.02.103-.024.243-.024.744a.75.75 0 0 1-1.5 0v-.073c0-.393 0-.696.053-.963a2.75 2.75 0 0 1 2.16-2.161C9.482 3 9.784 3 10.178 3ZM4.56 10.5l.97.97a.75.75 0 0 1-1.061 1.06l-2.25-2.25a.75.75 0 0 1 0-1.06l2.25-2.25a.75.75 0 1 1 1.06 1.06L4.56 9h6.69a.75.75 0 0 1 0 1.5H4.56Z" clip-rule="evenodd"></path></svg></div>
				<div><span>Dawn</span></div>
			</div>
			<div>				
				<span>
					<svg viewBox="0 0 20 20"><path d="M6 10c0-.93 0-1.395.102-1.776a3 3 0 0 1 2.121-2.122C8.605 6 9.07 6 10 6c.93 0 1.395 0 1.776.102a3 3 0 0 1 2.122 2.122C14 8.605 14 9.07 14 10s0 1.395-.102 1.777a3 3 0 0 1-2.122 2.12C11.395 14 10.93 14 10 14s-1.395 0-1.777-.102a3 3 0 0 1-2.12-2.121C6 11.395 6 10.93 6 10Z"></path></svg>
					<span style = "white-space:pre;">라이브</span>
				</span>
			</div>
			<div>
				<button>
					<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6 10a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"></path><path d="M11.5 10a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"></path><path d="M17 10a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"></path></svg>
				</button>
			</div>
		</div>
		<div>
			<div>
				<button>
					<div>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M3 10a7 7 0 1 1 14 0 7 7 0 0 1-14 0Zm7-5.5a5.497 5.497 0 0 0-4.737 2.703l2 1.999c.472.472.737 1.113.737 1.78v.518a.5.5 0 0 0 .5.5 2 2 0 0 1 2 2v1.478a5.504 5.504 0 0 0 4.52-3.228h-1.02a.75.75 0 0 1-.75-.75v-.5a.75.75 0 0 0-.75-.75h-2.5a1.755 1.755 0 0 1-1.07-3.144l.463-.356a.393.393 0 0 0 .152-.312v-.04c0-.885.62-1.624 1.449-1.808a5.531 5.531 0 0 0-.994-.09Zm2.875.81a1.85 1.85 0 0 1-1.477.735.352.352 0 0 0-.353.353v.04c0 .587-.271 1.14-.736 1.499l-.462.356a.256.256 0 0 0 .153.457h2.5a2.25 2.25 0 0 1 2.236 2h.713a5.497 5.497 0 0 0-2.574-5.44Zm-8.375 4.69c0-.443.052-.875.152-1.288l1.55 1.55c.19.191.298.45.298.72v.518a2 2 0 0 0 2 2 .5.5 0 0 1 .5.5v1.41a5.502 5.502 0 0 1-4.5-5.41Z"></path></svg>
						<div>기본</div>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M5.72 8.47a.75.75 0 0 1 1.06 0l3.47 3.47 3.47-3.47a.75.75 0 1 1 1.06 1.06l-4 4a.75.75 0 0 1-1.06 0l-4-4a.75.75 0 0 1 0-1.06Z"></path></svg>
					</div>
				</button>
			</div>
			<div></div>
			<div>
				<button>
					<div>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M8.344 3.692a2.25 2.25 0 0 1 3.312 0l3.854 4.19a3.75 3.75 0 0 1 .99 2.538v3.33a2.75 2.75 0 0 1-2.75 2.75h-1.75a1.5 1.5 0 0 1-1.5-1.5v-2h-1v2a1.5 1.5 0 0 1-1.5 1.5h-1.75a2.75 2.75 0 0 1-2.75-2.75v-3.33c0-.94.353-1.847.99-2.539l3.854-4.189Zm2.208 1.016a.75.75 0 0 0-1.104 0l-3.854 4.189a2.25 2.25 0 0 0-.594 1.523v3.33c0 .69.56 1.25 1.25 1.25h1.75v-2a1.5 1.5 0 0 1 1.5-1.5h1a1.5 1.5 0 0 1 1.5 1.5v2h1.75c.69 0 1.25-.56 1.25-1.25v-3.33a2.25 2.25 0 0 0-.594-1.523l-3.854-4.19Z"></path></svg>
						<div>홈페이지</div>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M5.72 8.47a.75.75 0 0 1 1.06 0l3.47 3.47 3.47-3.47a.75.75 0 1 1 1.06 1.06l-4 4a.75.75 0 0 1-1.06 0l-4-4a.75.75 0 0 1 0-1.06Z"></path></svg>
					</div>
				</button>
			</div>
		</div>
		<div>
			<div>
				<div>
					<button>
						<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" clip-rule="evenodd" d="M3.25 5c0-.966.784-1.75 1.75-1.75h.5a.75.75 0 0 1 0 1.5H5a.25.25 0 0 0-.25.25v.5a.75.75 0 0 1-1.5 0V5Zm0 10c0 .966.784 1.75 1.75 1.75h.5a.75.75 0 0 0 0-1.5H5a.25.25 0 0 1-.25-.25v-.5a.75.75 0 0 0-1.5 0v.5ZM15 3.25c.966 0 1.75.784 1.75 1.75v.5a.75.75 0 0 1-1.5 0V5a.25.25 0 0 0-.25-.25h-.5a.75.75 0 0 1 0-1.5h.5Zm-11 5a.75.75 0 0 1 .75.75v2a.75.75 0 0 1-1.5 0V9A.75.75 0 0 1 4 8.25ZM11.75 4a.75.75 0 0 1-.75.75H9a.75.75 0 0 1 0-1.5h2a.75.75 0 0 1 .75.75Zm-1.506 5.043a.75.75 0 0 0-.957.957l2.121 6.01a.75.75 0 0 0 1.238.28l1.237-1.237 1.415 1.415a.75.75 0 0 0 1.06 0l.354-.354a.75.75 0 0 0 0-1.06l-1.415-1.415 1.238-1.237a.75.75 0 0 0-.28-1.238l-6.011-2.121Z"></path></svg>
					</button>
				</div>
				<div>
					<ul>
						<li>
							<button>
								<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M3.5 6.25a2.75 2.75 0 0 1 2.75-2.75h7.5a2.75 2.75 0 0 1 2.75 2.75v4.5a2.75 2.75 0 0 1-2.75 2.75h-1.25v1.5h.75a.75.75 0 0 1 0 1.5h-6.5a.75.75 0 0 1 0-1.5h.75v-1.5h-1.25a2.75 2.75 0 0 1-2.75-2.75v-4.5Zm5.5 7.25h2v1.5h-2v-1.5Zm-2.75-8.5c-.69 0-1.25.56-1.25 1.25v3.25h10v-3.25c0-.69-.56-1.25-1.25-1.25h-7.5Zm8.725 6c-.116.57-.62 1-1.225 1h-7.5a1.25 1.25 0 0 1-1.225-1h9.95Z"></path></svg>
							</button>
						</li>
						<li>
							<button>
								<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M7.75 13.75a.75.75 0 0 1 .75-.75h3a.75.75 0 0 1 0 1.5h-3a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M4.75 5.75a2.75 2.75 0 0 1 2.75-2.75h5a2.75 2.75 0 0 1 2.75 2.75v8.5a2.75 2.75 0 0 1-2.75 2.75h-5a2.75 2.75 0 0 1-2.75-2.75v-8.5Zm2.75-1.25c-.69 0-1.25.56-1.25 1.25v8.5c0 .69.56 1.25 1.25 1.25h5c.69 0 1.25-.56 1.25-1.25v-8.5c0-.69-.56-1.25-1.25-1.25h-.531a1 1 0 0 1-.969.75h-2a1 1 0 0 1-.969-.75h-.531Z"></path></svg>
							</button>
						</li>
						<li>
							<button>
								<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M4 5.75a2.75 2.75 0 0 1 2.75-2.75h6.5a2.75 2.75 0 0 1 2.75 2.75v.875a.75.75 0 0 1-1.5 0v-.875c0-.69-.56-1.25-1.25-1.25h-6.5c-.69 0-1.25.56-1.25 1.25v.875a.75.75 0 0 1-1.5 0v-.875Z"></path><path d="M4.75 12.625a.75.75 0 0 1 .75.75v.875c0 .69.56 1.25 1.25 1.25h6.5c.69 0 1.25-.56 1.25-1.25v-.875a.75.75 0 0 1 1.5 0v.875a2.75 2.75 0 0 1-2.75 2.75h-6.5a2.75 2.75 0 0 1-2.75-2.75v-.875a.75.75 0 0 1 .75-.75Z"></path><path d="M9.75 10a.75.75 0 0 1-.75.75h-2.44l.72.72a.75.75 0 1 1-1.06 1.06l-2-2a.75.75 0 0 1 0-1.06l2-2a.75.75 0 1 1 1.06 1.06l-.72.72h2.44a.75.75 0 0 1 .75.75Z"></path><path d="M11 10.75a.75.75 0 0 1 0-1.5h2.44l-.72-.72a.75.75 0 0 1 1.06-1.06l2 2a.75.75 0 0 1 0 1.06l-2 2a.75.75 0 1 1-1.06-1.06l.72-.72h-2.44Z"></path></svg>
							</button>
						</li>
					</ul>
				</div>
				<div>
					<button>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M7.47 3.72a.75.75 0 0 1 1.06 1.06l-1.72 1.72h3.94a5 5 0 0 1 0 10h-1.5a.75.75 0 0 1 0-1.5h1.5a3.5 3.5 0 1 0 0-7h-3.94l1.72 1.72a.75.75 0 1 1-1.06 1.06l-3-3a.75.75 0 0 1 0-1.06l3-3Z"></path></svg>
					</button>
					<button>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M12.53 3.72a.75.75 0 1 0-1.06 1.06l1.72 1.72h-3.94a5 5 0 0 0 0 10h1.5a.75.75 0 0 0 0-1.5h-1.5a3.5 3.5 0 1 1 0-7h3.94l-1.72 1.72a.75.75 0 1 0 1.06 1.06l3-3a.75.75 0 0 0 0-1.06l-3-3Z"></path></svg>
					</button>
				</div>
			</div>
			<div>
				<button>
					<span>저장</span>
				</button>
			</div>
		</div>
	</div>
	<div id= "boad">
		<div id="boad_1">
			<ul>
				<li>
					<button>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.5 6.25c0-1.519 1.231-2.75 2.75-2.75.414 0 .75.336.75.75s-.336.75-.75.75c-.69 0-1.25.56-1.25 1.25 0 .414-.336.75-.75.75s-.75-.336-.75-.75Z"></path><path fill-rule="evenodd" d="M3.5 9.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5c0 .966-.784 1.75-1.75 1.75h-9.5c-.966 0-1.75-.784-1.75-1.75v-1.5Zm1.75-.25c-.138 0-.25.112-.25.25v1.5c0 .138.112.25.25.25h9.5c.138 0 .25-.112.25-.25v-1.5c0-.138-.112-.25-.25-.25h-9.5Z"></path><path d="M3.5 13.75c0 1.519 1.231 2.75 2.75 2.75.414 0 .75-.336.75-.75s-.336-.75-.75-.75c-.69 0-1.25-.56-1.25-1.25 0-.414-.336-.75-.75-.75s-.75.336-.75.75Z"></path><path d="M13.75 3.5c1.519 0 2.75 1.231 2.75 2.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.69-.56-1.25-1.25-1.25-.414 0-.75-.336-.75-.75s.336-.75.75-.75Z"></path><path d="M13.75 16.5c1.519 0 2.75-1.231 2.75-2.75 0-.414-.336-.75-.75-.75s-.75.336-.75.75c0 .69-.56 1.25-1.25 1.25-.414 0-.75.336-.75.75s.336.75.75.75Z"></path><path d="M11.75 4.25c0 .414-.336.75-.75.75h-2c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h2c.414 0 .75.336.75.75Z"></path><path d="M11 16.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-2c-.414 0-.75.336-.75.75s.336.75.75.75h2Z"></path></svg>
					</button>
				</li>
				<li>
					<button>
						<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M12.5 10a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0Zm-1.5 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"></path><path fill-rule="evenodd" d="M9.377 2.5c-.926 0-1.676.75-1.676 1.676v.688c0 .056-.043.17-.198.251-.153.08-.303.168-.448.262-.147.097-.268.076-.318.048l-.6-.346a1.676 1.676 0 0 0-2.29.613l-.622 1.08a1.676 1.676 0 0 0 .613 2.289l.648.374c.048.028.124.12.119.29a5.484 5.484 0 0 0 .005.465c.009.175-.07.27-.119.299l-.653.377a1.676 1.676 0 0 0-.613 2.29l.623 1.08a1.676 1.676 0 0 0 2.29.613l.7-.405c.048-.028.166-.048.312.043.115.071.233.139.353.202.155.08.198.195.198.251v.811c0 .926.75 1.676 1.676 1.676h1.246c.926 0 1.676-.75 1.676-1.676v-.81c0-.057.042-.171.197-.252.121-.063.239-.13.354-.202.146-.091.264-.07.312-.043l.7.405a1.676 1.676 0 0 0 2.29-.614l.623-1.08a1.676 1.676 0 0 0-.613-2.289l-.653-.377c-.05-.029-.128-.123-.119-.3a5.494 5.494 0 0 0 .005-.463c-.005-.171.07-.263.12-.291l.647-.374a1.676 1.676 0 0 0 .613-2.29l-.623-1.079a1.676 1.676 0 0 0-2.29-.613l-.6.346c-.049.028-.17.048-.318-.048a5.4 5.4 0 0 0-.448-.262c-.155-.081-.197-.195-.197-.251v-.688c0-.926-.75-1.676-1.676-1.676h-1.246Zm-.176 1.676c0-.097.078-.176.176-.176h1.246c.097 0 .176.079.176.176v.688c0 .728.462 1.298 1.003 1.58.11.058.219.122.323.19.517.337 1.25.458 1.888.09l.6-.346a.176.176 0 0 1 .24.064l.623 1.08a.176.176 0 0 1-.064.24l-.648.374c-.623.36-.888 1.034-.868 1.638a4.184 4.184 0 0 1-.004.337c-.032.615.23 1.31.867 1.677l.653.377a.176.176 0 0 1 .064.24l-.623 1.08a.176.176 0 0 1-.24.065l-.701-.405c-.624-.36-1.341-.251-1.855.069a3.91 3.91 0 0 1-.255.145c-.54.283-1.003.853-1.003 1.581v.811a.176.176 0 0 1-.176.176h-1.246a.176.176 0 0 1-.176-.176v-.81c0-.73-.462-1.3-1.003-1.582a3.873 3.873 0 0 1-.255-.146c-.514-.32-1.23-.428-1.855-.068l-.7.405a.176.176 0 0 1-.241-.065l-.623-1.08a.176.176 0 0 1 .064-.24l.653-.377c.637-.368.899-1.062.867-1.677a3.97 3.97 0 0 1-.004-.337c.02-.604-.245-1.278-.868-1.638l-.648-.374a.176.176 0 0 1-.064-.24l.623-1.08a.176.176 0 0 1 .24-.064l.6.346c.638.368 1.37.247 1.888-.09a3.85 3.85 0 0 1 .323-.19c.54-.282 1.003-.852 1.003-1.58v-.688Z"></path></svg>
					</button>
				</li>
			</ul>
		</div>
		<div id="boad_2">
			<div>
				<div>
					<div>
						<h1>홈페이지</h1>
					</div>
				</div>
			</div>
			<div style= "overflow-x: hidden; overflow-y: scroll;">
				<section>
					<div id="head_text">
						<section>
							<h3>머리글</h3>
						</section>
						<section>
							<ol class="list">
								<li>
									<div>
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.5 6.25c0-1.519 1.231-2.75 2.75-2.75.414 0 .75.336.75.75s-.336.75-.75.75c-.69 0-1.25.56-1.25 1.25 0 .414-.336.75-.75.75s-.75-.336-.75-.75Z"></path><path fill-rule="evenodd" d="M3.5 9.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5c0 .966-.784 1.75-1.75 1.75h-9.5c-.966 0-1.75-.784-1.75-1.75v-1.5Zm1.75-.25c-.138 0-.25.112-.25.25v1.5c0 .138.112.25.25.25h9.5c.138 0 .25-.112.25-.25v-1.5c0-.138-.112-.25-.25-.25h-9.5Z"></path><path d="M3.5 13.75c0 1.519 1.231 2.75 2.75 2.75.414 0 .75-.336.75-.75s-.336-.75-.75-.75c-.69 0-1.25-.56-1.25-1.25 0-.414-.336-.75-.75-.75s-.75.336-.75.75Z"></path><path d="M13.75 3.5c1.519 0 2.75 1.231 2.75 2.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.69-.56-1.25-1.25-1.25-.414 0-.75-.336-.75-.75s.336-.75.75-.75Z"></path><path d="M13.75 16.5c1.519 0 2.75-1.231 2.75-2.75 0-.414-.336-.75-.75-.75s-.75.336-.75.75c0 .69-.56 1.25-1.25 1.25-.414 0-.75.336-.75.75s.336.75.75.75Z"></path><path d="M11.75 4.25c0 .414-.336.75-.75.75h-2c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h2c.414 0 .75.336.75.75Z"></path><path d="M11 16.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-2c-.414 0-.75.336-.75.75s.336.75.75.75h2Z"></path></svg>
											<span class="two__">공지표시줄</span>
										</button>
									</div>
									<div>
										<ol class="list">
											<% for(int i=0; i<=nbDto.size()-1; i++) { %>
												<li class="one____">
													<button class="one__">
														<svg style=""viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M5 6.25c0-.69.56-1.25 1.25-1.25h2a.75.75 0 0 0 0-1.5h-2a2.75 2.75 0 0 0-2.75 2.75v2a.75.75 0 0 0 1.5 0v-2Z"></path><path d="M13.75 5c.69 0 1.25.56 1.25 1.25v2a.75.75 0 0 0 1.5 0v-2a2.75 2.75 0 0 0-2.75-2.75h-2a.75.75 0 0 0 0 1.5h2Z"></path><path d="M13.75 15c.69 0 1.25-.56 1.25-1.25v-2a.75.75 0 0 1 1.5 0v2a2.75 2.75 0 0 1-2.75 2.75h-2a.75.75 0 0 1 0-1.5h2Z"></path><path d="M6.25 15c-.69 0-1.25-.56-1.25-1.25v-2a.75.75 0 0 0-1.5 0v2a2.75 2.75 0 0 0 2.75 2.75h2a.75.75 0 0 0 0-1.5h-2Z"></path></svg>
														<span class="two__"><%=nbDto.get(i).getContent() %></span>
													</button>
												</li>
											<% } %>
											<li class="one____">
												<button id="add_notice" class="one__ click">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span calss="two__"style="color:#005bd3">공지 추가</span>
												</button>
											</li>
										</ol>
									</div>
								</li>
								<li>
									<div>
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M3.5 5.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5a1.75 1.75 0 0 1-1.75 1.75h-9.5a1.75 1.75 0 0 1-1.75-1.75v-1.5Zm1.75-.25a.25.25 0 0 0-.25.25v1.5c0 .138.112.25.25.25h9.5a.25.25 0 0 0 .25-.25v-1.5a.25.25 0 0 0-.25-.25h-9.5Z"></path><path d="M3.5 11.25c0-.966.784-1.75 1.75-1.75h.5a.75.75 0 0 1 0 1.5h-.5a.25.25 0 0 0-.25.25v.5a.75.75 0 0 1-1.5 0v-.5Z"></path><path d="M3.5 14.75c0 .966.784 1.75 1.75 1.75h.5a.75.75 0 0 0 0-1.5h-.5a.25.25 0 0 1-.25-.25v-.5a.75.75 0 0 0-1.5 0v.5Z"></path><path d="M14.75 9.5c.966 0 1.75.784 1.75 1.75v.5a.75.75 0 0 1-1.5 0v-.5a.25.25 0 0 0-.25-.25h-.5a.75.75 0 0 1 0-1.5h.5Z"></path><path d="M14.75 16.5a1.75 1.75 0 0 0 1.75-1.75v-.5a.75.75 0 0 0-1.5 0v.5a.25.25 0 0 1-.25.25h-.5a.75.75 0 0 0 0 1.5h.5Z"></path><path d="M11.75 10.25a.75.75 0 0 1-.75.75h-2a.75.75 0 0 1 0-1.5h2a.75.75 0 0 1 .75.75Z"></path><path d="M11 16.5a.75.75 0 0 0 0-1.5h-2a.75.75 0 0 0 0 1.5h2Z"></path></svg>
											<span class="two__">머리글</span>
										</button>
									</div>
								</li>
							</ol>
						</section>
					</div>
				</section>
				<section>
					<div id="template">
						<section>
							<h3>템플릿</h3>
						</section>
						<section>
							<ol class="list">
								<li>
									<div>
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<img class="two_ Online-Store-UI-ThumbnailsStack--image_1amzv" src="https://cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671_80x80.jpg?v=1713952288" alt="">
											<span class="two__">이미지 배너</span>
										</button>
									</div>
									<div class="one___">
										<ol class="list">
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M4 4.75a.75.75 0 0 1 .75-.75h10.5a.75.75 0 0 1 .75.75v1.5a.75.75 0 0 1-1.5 0v-.75h-3.5v8.75h1.25a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5h1.25v-8.75h-3.5v.75a.75.75 0 0 1-1.5 0v-1.5Z"></path></svg>
													<span class="two__">Protect your Vision</span>
												</button>
											</li>
											<li>	
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.75 4a3.75 3.75 0 0 0-3.75 3.75v2.5a3.75 3.75 0 0 0 3.75 3.75h1.5a.75.75 0 0 0 0-1.5h-1.5a2.25 2.25 0 0 1-2.25-2.25v-2.5a2.25 2.25 0 0 1 2.25-2.25h6.5a2.25 2.25 0 0 1 2.25 2.25v.5a.75.75 0 0 0 1.5 0v-.5a3.75 3.75 0 0 0-3.75-3.75h-6.5Z"></path><path d="M9.464 8.464a.75.75 0 0 1 .78-.176l6.01 2.12a.75.75 0 0 1 .281 1.238l-1.237 1.238 1.414 1.414a.75.75 0 0 1 0 1.06l-.353.354a.75.75 0 0 1-1.06 0l-1.415-1.414-1.238 1.238a.75.75 0 0 1-1.237-.281l-2.121-6.01a.75.75 0 0 1 .176-.78Z"></path></svg>
													<span class="two__">버튼</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<span>
														<span>
															<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
														</span>
														<span class="two__">Give customers details about the banner image(s) or content on the template.</span>
													</span>
												</button>
											</li>
											<li>
												<button class="one__">
												<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
												<span class="two__">블록 추가(3/3)</span>
												</button>	
											</li>
										</ol>
									</div>
								</li>
								<li>
									<div style="margin-left: 21px;">
										<button class="one__">
											<span class="two_">
												<img style="max-width:100%; max-height:100%;"class="Online-Store-UI-ThumbnailsStack--image_1amzv" src="https://cdn.shopify.com/s/files/1/0645/3939/4240/collections/images_80x80.png?v=1714097828" alt="">
											</span>
											<span class="two__">추천 컬렉션</span>
										</button>
									</div>
								</li>
								<li>
									<div>
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<img class="two_ Online-Store-UI-ThumbnailsStack--image_1amzv" src="https://cdn.shopify.com/s/files/1/0645/3939/4240/files/37566_66933_2612_80x80.jpg?v=1713952881" alt="">
											<span class="two__">이미지 배너</span>
										</button>
									</div>
									<div class="one___">
										<ol class="list">
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M4 4.75a.75.75 0 0 1 .75-.75h10.5a.75.75 0 0 1 .75.75v1.5a.75.75 0 0 1-1.5 0v-.75h-3.5v8.75h1.25a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5h1.25v-8.75h-3.5v.75a.75.75 0 0 1-1.5 0v-1.5Z"></path></svg>
													<span class="two__">IPHONE</span>
												</button>
											</li>
											<li>	
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
													<span class="two__">텍스트</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.75 4a3.75 3.75 0 0 0-3.75 3.75v2.5a3.75 3.75 0 0 0 3.75 3.75h1.5a.75.75 0 0 0 0-1.5h-1.5a2.25 2.25 0 0 1-2.25-2.25v-2.5a2.25 2.25 0 0 1 2.25-2.25h6.5a2.25 2.25 0 0 1 2.25 2.25v.5a.75.75 0 0 0 1.5 0v-.5a3.75 3.75 0 0 0-3.75-3.75h-6.5Z"></path><path d="M9.464 8.464a.75.75 0 0 1 .78-.176l6.01 2.12a.75.75 0 0 1 .281 1.238l-1.237 1.238 1.414 1.414a.75.75 0 0 1 0 1.06l-.353.354a.75.75 0 0 1-1.06 0l-1.415-1.414-1.238 1.238a.75.75 0 0 1-1.237-.281l-2.121-6.01a.75.75 0 0 1 .176-.78Z"></path></svg>
													<span class="two__">버튼</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span class="two__">블록 추가(3/3)</span>
												</button>		
											</li>
										</ol>
									</div>
								</li>
								<li>
									<div>
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.5 6.25c0-1.519 1.231-2.75 2.75-2.75.414 0 .75.336.75.75s-.336.75-.75.75c-.69 0-1.25.56-1.25 1.25 0 .414-.336.75-.75.75s-.75-.336-.75-.75Z"></path><path fill-rule="evenodd" d="M3.5 9.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5c0 .966-.784 1.75-1.75 1.75h-9.5c-.966 0-1.75-.784-1.75-1.75v-1.5Zm1.75-.25c-.138 0-.25.112-.25.25v1.5c0 .138.112.25.25.25h9.5c.138 0 .25-.112.25-.25v-1.5c0-.138-.112-.25-.25-.25h-9.5Z"></path><path d="M3.5 13.75c0 1.519 1.231 2.75 2.75 2.75.414 0 .75-.336.75-.75s-.336-.75-.75-.75c-.69 0-1.25-.56-1.25-1.25 0-.414-.336-.75-.75-.75s-.75.336-.75.75Z"></path><path d="M13.75 3.5c1.519 0 2.75 1.231 2.75 2.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.69-.56-1.25-1.25-1.25-.414 0-.75-.336-.75-.75s.336-.75.75-.75Z"></path><path d="M13.75 16.5c1.519 0 2.75-1.231 2.75-2.75 0-.414-.336-.75-.75-.75s-.75.336-.75.75c0 .69-.56 1.25-1.25 1.25-.414 0-.75.336-.75.75s.336.75.75.75Z"></path><path d="M11.75 4.25c0 .414-.336.75-.75.75h-2c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h2c.414 0 .75.336.75.75Z"></path><path d="M11 16.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-2c-.414 0-.75.336-.75.75s.336.75.75.75h2Z"></path></svg>
											<span class="two__">여러 열</span>
										</button>
									</div>
									<div class="one___">
										<ol class="list">
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"></path></svg>
													<span class="two__">4</span>
												</button>	
											</li>
											<li>	
												<button class="one__">
												<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"></path></svg>
												<span class="two__">3</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"></path></svg>
													<span class="two__">2</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"></path></svg>
													<span class="two__">8</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"></path></svg>
													<span class="two__">5</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.75 3c-2.071 0-3.75 1.679-3.75 3.75v6.5c0 2.071 1.679 3.75 3.75 3.75h6.5c2.071 0 3.75-1.679 3.75-3.75v-6.5c0-2.071-1.679-3.75-3.75-3.75h-6.5Zm-2.25 3.75c0-1.243 1.007-2.25 2.25-2.25h2.5v11h-2.5c-1.243 0-2.25-1.007-2.25-2.25v-6.5Zm6.25 8.75h2.5c1.243 0 2.25-1.007 2.25-2.25v-6.5c0-1.243-1.007-2.25-2.25-2.25h-2.5v11Z"></path></svg>
													<span class="two__">1</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span class="two__ blue">열 추가</span>
												</button>	
											</li>
										</ol>
									</div>
								</li>
								<li>
									<div>
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M7.25 6.5a.75.75 0 0 0 0 1.5h5.5a.75.75 0 0 0 0-1.5h-5.5Z"></path><path d="M6.5 10a.75.75 0 0 1 .75-.75h5.5a.75.75 0 0 1 0 1.5h-5.5a.75.75 0 0 1-.75-.75Z"></path><path d="M7.25 12a.75.75 0 0 0 0 1.5h3.5a.75.75 0 0 0 0-1.5h-3.5Z"></path><path fill-rule="evenodd" d="M7.25 3.5a3.75 3.75 0 0 0-3.75 3.75v5.5a3.75 3.75 0 0 0 3.75 3.75h5.5a3.75 3.75 0 0 0 3.75-3.75v-5.5a3.75 3.75 0 0 0-3.75-3.75h-5.5Zm-2.25 3.75a2.25 2.25 0 0 1 2.25-2.25h5.5a2.25 2.25 0 0 1 2.25 2.25v5.5a2.25 2.25 0 0 1-2.25 2.25h-5.5a2.25 2.25 0 0 1-2.25-2.25v-5.5Z"></path></svg>
											<span class="two__">서식있는 텍스트</span>
										</button>	
									</div>
									<div class="one___">
										<ol class="list">
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M4 4.75a.75.75 0 0 1 .75-.75h10.5a.75.75 0 0 1 .75.75v1.5a.75.75 0 0 1-1.5 0v-.75h-3.5v8.75h1.25a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5h1.25v-8.75h-3.5v.75a.75.75 0 0 1-1.5 0v-1.5Z"></path></svg>
													<span class="two__">Talk abrandbout your</span>
												</button>
											</li>
											<li>	
												<button class="one__">
													<span class="flex">
														<span>
														<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
														</span>
														<span style="text-overflow: ellipsis;" class="two__">Share information about your brand with your customers. Describe a product, make announcements, or welcome customers to your store.</span>
													</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.75 4a3.75 3.75 0 0 0-3.75 3.75v2.5a3.75 3.75 0 0 0 3.75 3.75h1.5a.75.75 0 0 0 0-1.5h-1.5a2.25 2.25 0 0 1-2.25-2.25v-2.5a2.25 2.25 0 0 1 2.25-2.25h6.5a2.25 2.25 0 0 1 2.25 2.25v.5a.75.75 0 0 0 1.5 0v-.5a3.75 3.75 0 0 0-3.75-3.75h-6.5Z"></path><path d="M9.464 8.464a.75.75 0 0 1 .78-.176l6.01 2.12a.75.75 0 0 1 .281 1.238l-1.237 1.238 1.414 1.414a.75.75 0 0 1 0 1.06l-.353.354a.75.75 0 0 1-1.06 0l-1.415-1.414-1.238 1.238a.75.75 0 0 1-1.237-.281l-2.121-6.01a.75.75 0 0 1 .176-.78Z"></path></svg>
													<span class="two__">버튼</span>
												</button>
											</li>
											<li>
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span class="two__ blue">블록 추가</span>	
												</button>
											</li>
										</ol>
									</div>
								</li>
								<li class="one">
									<div class="one_one">
										<button class="one__">
											<svg class="two_" viewBox="0 0 20 20" class="Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M13.5 7a1.25 1.25 0 1 1-2.5 0 1.25 1.25 0 0 1 2.5 0Z"></path><path fill-rule="evenodd" d="M11.031 3.25h-2.062c-.79 0-1.427 0-1.944.041-.532.042-1 .131-1.434.346a3.75 3.75 0 0 0-1.704 1.704c-.215.435-.304.902-.346 1.434-.041.517-.041 1.154-.041 1.944v.062c0 .79 0 1.428.041 1.944.042.532.131 1 .346 1.434a3.75 3.75 0 0 0 1.704 1.704c.435.215.902.304 1.434.346.517.041 1.154.041 1.944.041h2.062c.79 0 1.428 0 1.944-.041.532-.042 1-.131 1.434-.346a3.75 3.75 0 0 0 1.704-1.704c.215-.435.304-.902.346-1.434.041-.516.041-1.154.041-1.944v-.062c0-.79 0-1.427-.041-1.944-.042-.532-.131-1-.346-1.434a3.75 3.75 0 0 0-1.704-1.704c-.435-.215-.902-.304-1.434-.346-.516-.041-1.154-.041-1.944-.041Zm-4.776 1.732c.193-.095.447-.16.889-.196.45-.035 1.027-.036 1.856-.036h2c.829 0 1.406 0 1.856.036.442.035.696.1.89.196.443.22.803.579 1.022 1.023.095.193.16.447.196.889.035.45.036 1.027.036 1.856 0 .348 0 .652-.003.92l-.213-.266a1.75 1.75 0 0 0-2.604-.144l-1.18 1.18-2.695-2.696a1.75 1.75 0 0 0-2.582.117l-.723.868c0-.818 0-1.389.036-1.835.035-.442.1-.696.196-.89a2.25 2.25 0 0 1 1.023-1.022Zm-1.176 5.994a1.8 1.8 0 0 0 .153.52c.22.443.579.803 1.023 1.022.193.095.447.16.889.196.45.035 1.027.036 1.856.036h2c.829 0 1.406 0 1.856-.036.442-.035.696-.1.89-.196a2.25 2.25 0 0 0 .927-.85l-1.06-1.327a.25.25 0 0 0-.373-.02l-1.71 1.71a.75.75 0 0 1-1.06 0l-3.226-3.226a.25.25 0 0 0-.369.016l-1.796 2.155Z"></path><path d="M6 17a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"></path><path d="M11 16a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z"></path><path d="M14 17a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"></path></svg>
											<span class="two__">슬라이드 쇼</span>
										</button>
									</div>
									<div class="one_two">
										<ol  class="list one_two_one">
											<li class="one_">
												<button class="one__">
													<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M9.018 3.5h1.964c.813 0 1.469 0 2 .043.546.045 1.026.14 1.47.366a3.75 3.75 0 0 1 1.64 1.639c.226.444.32.924.365 1.47.043.531.043 1.187.043 2v1.792a.75.75 0 0 1-1.5 0v-1.76c0-.852 0-1.447-.038-1.91-.037-.453-.107-.714-.207-.911a2.25 2.25 0 0 0-.984-.984c-.197-.1-.458-.17-.912-.207-.462-.037-1.056-.038-1.909-.038h-1.9c-.852 0-1.447 0-1.91.038-.453.037-.714.107-.911.207a2.25 2.25 0 0 0-.984.984c-.1.197-.17.458-.207.912-.037.462-.038 1.057-.038 1.909v1.428l.723-.867a1.75 1.75 0 0 1 2.582-.117l3.225 3.226a.75.75 0 0 1-1.06 1.06l-3.226-3.225a.25.25 0 0 0-.369.016l-1.799 2.16a.746.746 0 0 1-.044.047l.006.081c.037.454.107.715.207.912.216.424.56.768.984.984.197.1.458.17.912.207.462.037 1.057.038 1.909.038h1.68a.75.75 0 0 1 0 1.5h-1.712c-.813 0-1.469 0-2-.043-.546-.045-1.026-.14-1.47-.366a3.75 3.75 0 0 1-1.64-1.639c-.226-.444-.32-.924-.365-1.47-.043-.531-.043-1.187-.043-2v-1.964c0-.813 0-1.469.043-2 .045-.546.14-1.026.366-1.47a3.75 3.75 0 0 1 1.639-1.64c.444-.226.924-.32 1.47-.365.531-.043 1.187-.043 2-.043Z"></path><path d="M12.5 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3Z"></path><path d="M12.5 13.25a.75.75 0 0 1 .75-.75h3.5a.75.75 0 0 1 0 1.5h-3.5a.75.75 0 0 1-.75-.75Z"></path><path d="M13.25 15a.75.75 0 0 0 0 1.5h2a.75.75 0 0 0 0-1.5h-2Z"></path></svg>
													<span class="two__">Image slide</span>
												</button>
											</li>	
											<li class="one_">
												<button class="one__">
													<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M9.018 3.5h1.964c.813 0 1.469 0 2 .043.546.045 1.026.14 1.47.366a3.75 3.75 0 0 1 1.64 1.639c.226.444.32.924.365 1.47.043.531.043 1.187.043 2v1.792a.75.75 0 0 1-1.5 0v-1.76c0-.852 0-1.447-.038-1.91-.037-.453-.107-.714-.207-.911a2.25 2.25 0 0 0-.984-.984c-.197-.1-.458-.17-.912-.207-.462-.037-1.056-.038-1.909-.038h-1.9c-.852 0-1.447 0-1.91.038-.453.037-.714.107-.911.207a2.25 2.25 0 0 0-.984.984c-.1.197-.17.458-.207.912-.037.462-.038 1.057-.038 1.909v1.428l.723-.867a1.75 1.75 0 0 1 2.582-.117l3.225 3.226a.75.75 0 0 1-1.06 1.06l-3.226-3.225a.25.25 0 0 0-.369.016l-1.799 2.16a.746.746 0 0 1-.044.047l.006.081c.037.454.107.715.207.912.216.424.56.768.984.984.197.1.458.17.912.207.462.037 1.057.038 1.909.038h1.68a.75.75 0 0 1 0 1.5h-1.712c-.813 0-1.469 0-2-.043-.546-.045-1.026-.14-1.47-.366a3.75 3.75 0 0 1-1.64-1.639c-.226-.444-.32-.924-.365-1.47-.043-.531-.043-1.187-.043-2v-1.964c0-.813 0-1.469.043-2 .045-.546.14-1.026.366-1.47a3.75 3.75 0 0 1 1.639-1.64c.444-.226.924-.32 1.47-.365.531-.043 1.187-.043 2-.043Z"></path><path d="M12.5 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3Z"></path><path d="M12.5 13.25a.75.75 0 0 1 .75-.75h3.5a.75.75 0 0 1 0 1.5h-3.5a.75.75 0 0 1-.75-.75Z"></path><path d="M13.25 15a.75.75 0 0 0 0 1.5h2a.75.75 0 0 0 0-1.5h-2Z"></path></svg>
													<span class="two__">Image slide</span>
												</button>
											</li>
											<li class="one_">
												<button class="one__">
													<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span class="two__ blue">슬라이드 추가</span>
												</button>	
											</li>
										</ol>
									</div>
								</li>
								<li class="one">
									<div class="one_one">
										<button class="one__">
											<img class="two_ Online-Store-UI-ThumbnailsStack--image_1amzv" src="https://cdn.shopify.com/s/files/1/0645/3939/4240/files/preview_images/6731f77a30bb46feb9b58dae4bc978a0.thumbnail.0000000000.jpg?v=1714362129" alt="">
											<span class="two__">동영상</span>
										</button>
									</div>
								</li>
								<li class="one">
									<div class="one_one">
										<button class="one__">
											<svg class="two_" viewBox="0 0 20 20" class="Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.5 6.25c0-1.519 1.231-2.75 2.75-2.75.414 0 .75.336.75.75s-.336.75-.75.75c-.69 0-1.25.56-1.25 1.25 0 .414-.336.75-.75.75s-.75-.336-.75-.75Z"></path><path fill-rule="evenodd" d="M3.5 9.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5c0 .966-.784 1.75-1.75 1.75h-9.5c-.966 0-1.75-.784-1.75-1.75v-1.5Zm1.75-.25c-.138 0-.25.112-.25.25v1.5c0 .138.112.25.25.25h9.5c.138 0 .25-.112.25-.25v-1.5c0-.138-.112-.25-.25-.25h-9.5Z"></path><path d="M3.5 13.75c0 1.519 1.231 2.75 2.75 2.75.414 0 .75-.336.75-.75s-.336-.75-.75-.75c-.69 0-1.25-.56-1.25-1.25 0-.414-.336-.75-.75-.75s-.75.336-.75.75Z"></path><path d="M13.75 3.5c1.519 0 2.75 1.231 2.75 2.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.69-.56-1.25-1.25-1.25-.414 0-.75-.336-.75-.75s.336-.75.75-.75Z"></path><path d="M13.75 16.5c1.519 0 2.75-1.231 2.75-2.75 0-.414-.336-.75-.75-.75s-.75.336-.75.75c0 .69-.56 1.25-1.25 1.25-.414 0-.75.336-.75.75s.336.75.75.75Z"></path><path d="M11.75 4.25c0 .414-.336.75-.75.75h-2c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h2c.414 0 .75.336.75.75Z"></path><path d="M11 16.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-2c-.414 0-.75.336-.75.75s.336.75.75.75h2Z"></path></svg>	
											<span class="two__">특별 제품</span>
										</button>
									</div>
									<div class="one_two">
										<ol  class="list one_two_one">
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M4 4.75a.75.75 0 0 1 .75-.75h10.5a.75.75 0 0 1 .75.75v1.5a.75.75 0 0 1-1.5 0v-.75h-3.5v8.75h1.25a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5h1.25v-8.75h-3.5v.75a.75.75 0 0 1-1.5 0v-1.5Z"></path></svg>
													<span class="two__">제목</span>
												</button>
											</li>
											<li class="one_">
												<button class="one__">	
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M8.575 4.649c.707-.734 1.682-1.149 2.7-1.149h1.975c1.795 0 3.25 1.455 3.25 3.25v1.5c0 .414-.336.75-.75.75s-.75-.336-.75-.75v-1.5c0-.966-.784-1.75-1.75-1.75h-1.974c-.611 0-1.197.249-1.62.69l-4.254 4.417c-.473.49-.466 1.269.016 1.75l2.898 2.898c.385.386 1.008.392 1.4.014l.451-.434c.299-.288.773-.279 1.06.02.288.298.28.773-.02 1.06l-.45.434c-.981.945-2.538.93-3.502-.033l-2.898-2.898c-1.06-1.06-1.075-2.772-.036-3.852l4.254-4.417Z"></path><path d="M14 7c0 .552-.448 1-1 1s-1-.448-1-1 .448-1 1-1 1 .448 1 1Z"></path><path d="M13.25 10.857c-.728.257-1.25.952-1.25 1.768 0 1.036.84 1.875 1.875 1.875h.75c.207 0 .375.168.375.375s-.168.375-.375.375h-1.875c-.414 0-.75.336-.75.75s.336.75.75.75h.5v.25c0 .414.336.75.75.75s.75-.336.75-.75v-.254c.977-.064 1.75-.877 1.75-1.871 0-1.036-.84-1.875-1.875-1.875h-.75c-.207 0-.375-.168-.375-.375s.168-.375.375-.375h1.875c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-1v-.25c0-.414-.336-.75-.75-.75s-.75.336-.75.75v.357Z"></path></svg>
													<span class="two__">가격</span>
												</button>
											</li>
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M6.01 13.99c.122 1.406 1.302 2.51 2.74 2.51h5c1.519 0 2.75-1.231 2.75-2.75v-5c0-1.438-1.104-2.618-2.51-2.74-.122-1.406-1.302-2.51-2.74-2.51h-5c-1.519 0-2.75 1.231-2.75 2.75v5c0 1.438 1.104 2.618 2.51 2.74Zm-.01-5.24c0-1.519 1.231-2.75 2.75-2.75h3.725c-.116-.57-.62-1-1.225-1h-5c-.69 0-1.25.56-1.25 1.25v5c0 .605.43 1.11 1 1.225v-3.725Zm1.5 4.836v-4.836c0-.69.56-1.25 1.25-1.25h4.836l-6.086 6.086Zm7.5.164v-4.836l-6.086 6.086h4.836c.69 0 1.25-.56 1.25-1.25Z"></path></svg>
													<span class="two__">이형 상품 피커</span>
												</button>	
											</li>
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M14.239 4.379a.75.75 0 1 0-1.478-.257l-.457 2.628h-3.478l.413-2.371a.75.75 0 0 0-1.478-.257l-.457 2.628h-2.804a.75.75 0 0 0 0 1.5h2.543l-.609 3.5h-2.434a.75.75 0 0 0 0 1.5h2.174l-.413 2.372a.75.75 0 1 0 1.478.257l.457-2.629h3.478l-.413 2.372a.75.75 0 1 0 1.478.257l.457-2.629h2.804a.75.75 0 0 0 0-1.5h-2.543l.609-3.5h2.434a.75.75 0 0 0 0-1.5h-2.174l.413-2.371Zm-6.282 7.371h3.477l.61-3.5h-3.478l-.61 3.5Z"></path></svg>
													<span class="two__">수량 선택기</span>
												</button>	
											</li>
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.75 4a3.75 3.75 0 0 0-3.75 3.75v2.5a3.75 3.75 0 0 0 3.75 3.75h1.5a.75.75 0 0 0 0-1.5h-1.5a2.25 2.25 0 0 1-2.25-2.25v-2.5a2.25 2.25 0 0 1 2.25-2.25h6.5a2.25 2.25 0 0 1 2.25 2.25v.5a.75.75 0 0 0 1.5 0v-.5a3.75 3.75 0 0 0-3.75-3.75h-6.5Z"></path><path d="M9.464 8.464a.75.75 0 0 1 .78-.176l6.01 2.12a.75.75 0 0 1 .281 1.238l-1.237 1.238 1.414 1.414a.75.75 0 0 1 0 1.06l-.353.354a.75.75 0 0 1-1.06 0l-1.415-1.414-1.238 1.238a.75.75 0 0 1-1.237-.281l-2.121-6.01a.75.75 0 0 1 .176-.78Z"></path></svg>
													<span class="two__">구매 버튼</span>	
												</button>
											</li>
											<li class="one_">
												<button class="one__">
													<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span class="two__ blue">블록 추가</span>	
												</button>
											</li>
										</ol>
									</div>
								</li>
								<li class="one">
									<div class="one_one">
										<button class="one__">
											<svg class="two_" viewBox="0 0 20 20" class="Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.5 6.25c0-1.519 1.231-2.75 2.75-2.75.414 0 .75.336.75.75s-.336.75-.75.75c-.69 0-1.25.56-1.25 1.25 0 .414-.336.75-.75.75s-.75-.336-.75-.75Z"></path><path fill-rule="evenodd" d="M3.5 9.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5c0 .966-.784 1.75-1.75 1.75h-9.5c-.966 0-1.75-.784-1.75-1.75v-1.5Zm1.75-.25c-.138 0-.25.112-.25.25v1.5c0 .138.112.25.25.25h9.5c.138 0 .25-.112.25-.25v-1.5c0-.138-.112-.25-.25-.25h-9.5Z"></path><path d="M3.5 13.75c0 1.519 1.231 2.75 2.75 2.75.414 0 .75-.336.75-.75s-.336-.75-.75-.75c-.69 0-1.25-.56-1.25-1.25 0-.414-.336-.75-.75-.75s-.75.336-.75.75Z"></path><path d="M13.75 3.5c1.519 0 2.75 1.231 2.75 2.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.69-.56-1.25-1.25-1.25-.414 0-.75-.336-.75-.75s.336-.75.75-.75Z"></path><path d="M13.75 16.5c1.519 0 2.75-1.231 2.75-2.75 0-.414-.336-.75-.75-.75s-.75.336-.75.75c0 .69-.56 1.25-1.25 1.25-.414 0-.75.336-.75.75s.336.75.75.75Z"></path><path d="M11.75 4.25c0 .414-.336.75-.75.75h-2c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h2c.414 0 .75.336.75.75Z"></path><path d="M11 16.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-2c-.414 0-.75.336-.75.75s.336.75.75.75h2Z"></path></svg>	
											<span class="two__">여러 행</span>
										</button>
									</div>
									<div class="one_two">
										<ol  class="list one_two_one">
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M7.25 3.5a3.75 3.75 0 0 0-3.75 3.75v5.5a3.75 3.75 0 0 0 3.75 3.75h5.5a3.75 3.75 0 0 0 3.75-3.75v-5.5a3.75 3.75 0 0 0-3.75-3.75h-5.5Zm-2.25 7.25v2a2.25 2.25 0 0 0 2.25 2.25h5.5a2.25 2.25 0 0 0 2.25-2.25v-2h-10Zm10-1.5v-2a2.25 2.25 0 0 0-2.25-2.25h-5.5a2.25 2.25 0 0 0-2.25 2.25v2h10Z"></path></svg>
													<span class="two__">Row</span>
												</button>
											</li>
											<li class="one_">
												<button class="one__">	
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M7.25 3.5a3.75 3.75 0 0 0-3.75 3.75v5.5a3.75 3.75 0 0 0 3.75 3.75h5.5a3.75 3.75 0 0 0 3.75-3.75v-5.5a3.75 3.75 0 0 0-3.75-3.75h-5.5Zm-2.25 7.25v2a2.25 2.25 0 0 0 2.25 2.25h5.5a2.25 2.25 0 0 0 2.25-2.25v-2h-10Zm10-1.5v-2a2.25 2.25 0 0 0-2.25-2.25h-5.5a2.25 2.25 0 0 0-2.25 2.25v2h10Z"></path></svg>
													<span class="two__">Row</span>
												</button>
											</li>
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M7.25 3.5a3.75 3.75 0 0 0-3.75 3.75v5.5a3.75 3.75 0 0 0 3.75 3.75h5.5a3.75 3.75 0 0 0 3.75-3.75v-5.5a3.75 3.75 0 0 0-3.75-3.75h-5.5Zm-2.25 7.25v2a2.25 2.25 0 0 0 2.25 2.25h5.5a2.25 2.25 0 0 0 2.25-2.25v-2h-10Zm10-1.5v-2a2.25 2.25 0 0 0-2.25-2.25h-5.5a2.25 2.25 0 0 0-2.25 2.25v2h10Z"></path></svg>
													<span class="two__">Row</span>	
												</button>
											</li>
											<li class="one_">
												<button class="one__">
													<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M7.25 3.5a3.75 3.75 0 0 0-3.75 3.75v5.5a3.75 3.75 0 0 0 3.75 3.75h5.5a3.75 3.75 0 0 0 3.75-3.75v-5.5a3.75 3.75 0 0 0-3.75-3.75h-5.5Zm-2.25 7.25v2a2.25 2.25 0 0 0 2.25 2.25h5.5a2.25 2.25 0 0 0 2.25-2.25v-2h-10Zm10-1.5v-2a2.25 2.25 0 0 0-2.25-2.25h-5.5a2.25 2.25 0 0 0-2.25 2.25v2h10Z"></path></svg>
													<span class="two__">Row</span>
												</button>	
											</li>
											<li class="one_">
												<button class="one__">
													<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
													<span class="two__ blue">열 추가</span>	
												</button>
											</li>
										</ol>
									</div>
								</li>
								<li class="one">
									<div class="one_one">
										<button class="one__">
											<svg viewBox="0 0 20 20" class="two_ Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M5.75 4.5c-1.519 0-2.75 1.231-2.75 2.75v5.5c0 1.519 1.231 2.75 2.75 2.75h8.5c1.519 0 2.75-1.231 2.75-2.75v-5.5c0-1.519-1.231-2.75-2.75-2.75h-8.5Zm-1.25 2.75c0-.69.56-1.25 1.25-1.25h8.5c.69 0 1.25.56 1.25 1.25v5.5c0 .69-.56 1.25-1.25 1.25h-8.5c-.69 0-1.25-.56-1.25-1.25v-5.5Zm2.067.32c-.375-.175-.821-.013-.997.363-.175.375-.013.821.363.997l3.538 1.651c.335.156.723.156 1.058 0l3.538-1.651c.376-.176.538-.622.363-.997-.175-.376-.622-.538-.997-.363l-3.433 1.602-3.433-1.602Z"></path></svg>
											<span class="two__">연락처 양식</span>
										</button>
									</div>
								</li>
								<li class="one">
									<div class="one_one">
										<button class="one__">
											<svg class="two_" viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
											<span class="two__ blue">섹션 추가</span>
										</button>	
									</div>
								</li>
							</ol>	
						</section>
					</div>
				</section>
				<section>
					<div id = "floor">
						<section>
							<div>
								<h3>바닥글</h3>
							</div>
						</section>
						<section>
							<div>
								<div>
									<ol>
										<li>
											<div>
												<button>
													<svg viewBox="0 0 20 20" class="Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
													<span>
														<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M5.75 4.5c-1.519 0-2.75 1.231-2.75 2.75v5.5c0 1.519 1.231 2.75 2.75 2.75h8.5c1.519 0 2.75-1.231 2.75-2.75v-5.5c0-1.519-1.231-2.75-2.75-2.75h-8.5Zm-1.25 2.75c0-.69.56-1.25 1.25-1.25h8.5c.69 0 1.25.56 1.25 1.25v5.5c0 .69-.56 1.25-1.25 1.25h-8.5c-.69 0-1.25-.56-1.25-1.25v-5.5Zm2.067.32c-.375-.175-.821-.013-.997.363-.175.375-.013.821.363.997l3.538 1.651c.335.156.723.156 1.058 0l3.538-1.651c.376-.176.538-.622.363-.997-.175-.376-.622-.538-.997-.363l-3.433 1.602-3.433-1.602Z"></path></svg>
														<span>이메일 가입</span>
													</span>
												</button>
											</div>
											<div>
												<ol>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M4 4.75a.75.75 0 0 1 .75-.75h10.5a.75.75 0 0 1 .75.75v1.5a.75.75 0 0 1-1.5 0v-.75h-3.5v8.75h1.25a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5h1.25v-8.75h-3.5v.75a.75.75 0 0 1-1.5 0v-1.5Z"></path></svg>
																<span>Subscribe to our emails</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>소제목</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path fill-rule="evenodd" d="M5.75 4.5c-1.519 0-2.75 1.231-2.75 2.75v5.5c0 1.519 1.231 2.75 2.75 2.75h8.5c1.519 0 2.75-1.231 2.75-2.75v-5.5c0-1.519-1.231-2.75-2.75-2.75h-8.5Zm-1.25 2.75c0-.69.56-1.25 1.25-1.25h8.5c.69 0 1.25.56 1.25 1.25v5.5c0 .69-.56 1.25-1.25 1.25h-8.5c-.69 0-1.25-.56-1.25-1.25v-5.5Zm2.067.32c-.375-.175-.821-.013-.997.363-.175.375-.013.821.363.997l3.538 1.651c.335.156.723.156 1.058 0l3.538-1.651c.376-.176.538-.622.363-.997-.175-.376-.622-.538-.997-.363l-3.433 1.602-3.433-1.602Z"></path></svg>
																<span>이메일 양식</span>
															</span>
														</button>
													</li>
												</ol>
											</div>
										</li>
										<li></li>
										<li>
											<div>
												<button>
													<svg viewBox="0 0 20 20" class="Online-Store-UI-IconWrapper__Icon_1aflm"><path fill-rule="evenodd" d="M6.24 8.2a.75.75 0 0 1 1.06.04l2.7 2.908 2.7-2.908a.75.75 0 1 1 1.1 1.02l-3.25 3.5a.75.75 0 0 1-1.1 0l-3.25-3.5a.75.75 0 0 1 .04-1.06Z"></path></svg>
													<span>
														<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.5 5.25c0-.966.784-1.75 1.75-1.75h.5a.75.75 0 0 1 0 1.5h-.5a.25.25 0 0 0-.25.25v.5a.75.75 0 0 1-1.5 0v-.5Z"></path><path fill-rule="evenodd" d="M3.5 13.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5a1.75 1.75 0 0 1-1.75 1.75h-9.5a1.75 1.75 0 0 1-1.75-1.75v-1.5Zm1.75-.25a.25.25 0 0 0-.25.25v1.5c0 .138.112.25.25.25h9.5a.25.25 0 0 0 .25-.25v-1.5a.25.25 0 0 0-.25-.25h-9.5Z"></path><path d="M3.5 8.75c0 .966.784 1.75 1.75 1.75h.5a.75.75 0 0 0 0-1.5h-.5a.25.25 0 0 1-.25-.25v-.5a.75.75 0 0 0-1.5 0v.5Z"></path><path d="M14.75 3.5c.966 0 1.75.784 1.75 1.75v.5a.75.75 0 0 1-1.5 0v-.5a.25.25 0 0 0-.25-.25h-.5a.75.75 0 0 1 0-1.5h.5Z"></path><path d="M14.75 10.5a1.75 1.75 0 0 0 1.75-1.75v-.5a.75.75 0 0 0-1.5 0v.5a.25.25 0 0 1-.25.25h-.5a.75.75 0 0 0 0 1.5h.5Z"></path><path d="M11.75 4.25a.75.75 0 0 1-.75.75h-2a.75.75 0 0 1 0-1.5h2a.75.75 0 0 1 .75.75Z"></path><path d="M11 10.5a.75.75 0 0 0 0-1.5h-2a.75.75 0 0 0 0 1.5h2Z"></path></svg>
														<span>바닥글</span>
													</span>
												</button>
											</div>
											<div>
												<ol>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>INFO</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>LEGAL</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>SUPPORT</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>OTHERS</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>Shiver</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M3.75 4a.75.75 0 0 0 0 1.5h12.5a.75.75 0 0 0 0-1.5h-12.5Z"></path><path d="M4 7.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path><path d="M3 11.75a.75.75 0 0 1 .75-.75h12.5a.75.75 0 0 1 0 1.5h-12.5a.75.75 0 0 1-.75-.75Z"></path><path d="M4 14.5a.75.75 0 0 0 0 1.5h8a.75.75 0 0 0 0-1.5h-8Z"></path></svg>
																<span>Heading</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<img src="https://cdn.shopify.com/s/files/1/0645/3939/4240/files/b51a05dbee7ab1a7c4d621c78230fa4a_80x80.svg?v=1713947639"/>
																<span>Image</span>
															</span>
														</button>
													</li>
													<li class= "liyeon">
														<button>
															<span>
																<svg viewBox="0 0 20 20" class="Polaris-Icon__Svg_375hu" focusable="false" aria-hidden="true"><path d="M6.25 10a.75.75 0 0 1 .75-.75h2.25v-2.25a.75.75 0 0 1 1.5 0v2.25h2.25a.75.75 0 0 1 0 1.5h-2.25v2.25a.75.75 0 0 1-1.5 0v-2.25h-2.25a.75.75 0 0 1-.75-.75Z"></path><path fill-rule="evenodd" d="M10 17a7 7 0 1 0 0-14 7 7 0 0 0 0 14Zm0-1.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"></path></svg>
																<span>블록 추가</span>
															</span>
														</button>
													</li>
												</ol>
											</div>
										</li>
										<li></li>
									</ol>
								</div>
							</div>
						</section>
					</div>
				</section>							
			</div>
		</div>
		<div id="boad_3" style="overflow-y: auto;">
			<!-- 공지표시줄 시작 -->
			<div id="nb">
				<div>
					<div>
						<button id="sunseo_down" class="click">
							<svg style="transform: rotate(90deg); width: 10px; height: 6px;"aria-hidden="true" focusable="false" class="icon icon-caret" viewBox="0 0 10 6">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M9.354.646a.5.5 0 00-.708 0L5 4.293 1.354.646a.5.5 0 00-.708.708l4 4a.5.5 0 00.708 0l4-4a.5.5 0 000-.708z" fill="currentColor">
							</path></svg>
						</button>
						<div>
							<div>
								<p>
									<% for(int i=0; i<=nbDto.size()-1; i++) { %>
										<span class="content nb_content" data-index="<%= i %>" style="display: <%= (i == 0 ? "block" : "none") %>;">
											<%= nbDto.get(i).getContent() %>
										</span>
									<% } %>
								</p>
							</div>
						</div>
						<button id="sunseo_up" class="click">
							<svg style="transform: rotate(270deg); width: 10px; height: 6px;"aria-hidden="true" focusable="false" class="icon icon-caret" viewBox="0 0 10 6">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M9.354.646a.5.5 0 00-.708 0L5 4.293 1.354.646a.5.5 0 00-.708.708l4 4a.5.5 0 00.708 0l4-4a.5.5 0 000-.708z" fill="currentColor">
							</path></svg>
						</button>
					</div>
				</div>
			</div>
			<!-- 공지표시줄 종료 -->
			
			<!-- 머리글 시작점 -->
			<div id="ht">
				<header>
					<h1>
						<a>
							<div>
								<img src="//cdn.shopify.com/s/files/1/0645/3939/4240/files/b51a05dbee7ab1a7c4d621c78230fa4a.svg?v=1713947639&width=600"/>
							</div>
						</a>
					</h1>
					<nav>
						<ul>
							<li>
								<details>
									<summary>
										<span>SMART DEVICE</span>
										<svg style="width: 10px; height: 6px;"aria-hidden="true" focusable="false" class="icon icon-caret" viewBox="0 0 10 6">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M9.354.646a.5.5 0 00-.708 0L5 4.293 1.354.646a.5.5 0 00-.708.708l4 4a.5.5 0 00.708 0l4-4a.5.5 0 000-.708z" fill="currentColor">
										</path></svg>
									</summary>
									<div>
										<ul>
											<li><a>APPLE</a></li>
											<li>
												<a>SAMSUNG</a>
												<ul>
													<li><a>ss</a></li>
													<li><a>sa</a></li>
												</ul>
											</li>
										</ul>
									</div>
								</details>
							</li>
							<li>
								<details>
									<summary>
										<span>AUTO</span>
										<svg style="width: 10px; height: 6px;"aria-hidden="true" focusable="false" class="icon icon-caret" viewBox="0 0 10 6">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M9.354.646a.5.5 0 00-.708 0L5 4.293 1.354.646a.5.5 0 00-.708.708l4 4a.5.5 0 00.708 0l4-4a.5.5 0 000-.708z" fill="currentColor">
										</path></svg>
									</summary>
									<div>
										<ul>
											<li><a>GMC</a></li>
										</ul>
									</div>
								</details>
							</li>
							<li>
								<details>
									<summary>
										<span>LIFE</span>
										<svg style="width: 10px; height: 6px;"aria-hidden="true" focusable="false" class="icon icon-caret" viewBox="0 0 10 6">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M9.354.646a.5.5 0 00-.708 0L5 4.293 1.354.646a.5.5 0 00-.708.708l4 4a.5.5 0 00.708 0l4-4a.5.5 0 000-.708z" fill="currentColor">
										</path></svg>
									</summary>
									<div>
										<ul>
											<li><a>BIKE</a></li>
										</ul>
									</div>
								</details>
							</li>
						</ul>
					</nav>
					<div class="fr">
						<details>
							<summary>
								<span>
									<img src="img/search.png"/>
								</span>
							</summary>
							<div>
								<div>
									<form>
										<div>
											<input type="search" name="q">
											<label>검색</label>
											<button>
												<img src="img/search.png"/>
											</button>
										</div>
									</form>
									<button type="button">
										<img src="img/close.png">
									</button>
								</div>
							</div>
						</details>
						<a>
							<svg class="icon icon-cart-empty" aria-hidden="true" focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" fill="none">
							<path d="m15.75 11.8h-3.16l-.77 11.6a5 5 0 0 0 4.99 5.34h7.38a5 5 0 0 0 4.99-5.33l-.78-11.61zm0 1h-2.22l-.71 10.67a4 4 0 0 0 3.99 4.27h7.38a4 4 0 0 0 4-4.27l-.72-10.67h-2.22v.63a4.75 4.75 0 1 1 -9.5 0zm8.5 0h-7.5v.63a3.75 3.75 0 1 0 7.5 0z" fill="currentColor" fill-rule="evenodd"></path>
							</svg>
						</a>
					</div>
				</header>
			</div>
			<!-- 머리글 종료 -->
			
			<!-- 메인 템플릿 시작점 -->
			<main id="template">
			<!-- 추천 컬렉션 시작점 -->
				<div>
					<div>
						<div>
							<h2>Featured products</h2>
						</div>
						<div>
							<ul>
								<li>
									<div>
										<div>
											<div>
												<svg style="width: 213.594px; height: 213.594px;"class="placeholder-svg" preserveAspectRatio="xMidYMid slice" width="448" height="448" viewBox="0 0 448 448" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_894_1529)"><path d="M448 0H0v448h448V0Z" fill="#F2F2F2"></path><path d="m354.54 158.19-33.31-35.87a59.971 59.971 0 0 0-32.2-18.01l-20.99-4.2c-2.72-.49-5.45-.93-8.17-1.33l-.01.01v-.01c-1.29-.21-2.58-.31-3.88-.29-1.3.01-2.6.14-3.88.38l-7.25 1.36-7.08 1.33c-4.54.85-9.13 1.28-13.72 1.27-4.59 0-9.19-.42-13.72-1.27l-7.08-1.33-7.25-1.36c-1.28-.24-2.58-.37-3.88-.38-1.3-.02-2.6.08-3.88.29v.01l-.01-.01c-2.73.4-5.46.83-8.17 1.33l-20.99 4.2a59.971 59.971 0 0 0-32.2 18.01l-33.31 35.87c-3.03 3.26-2.81 8.37.48 11.36l32.37 29.43c3.16 2.87 8.02 2.76 11.04-.26l9.48-9.48c1.89-1.89 5.12-.55 5.12 2.12v136.76c0 4.42 3.58 8 8 8h128c4.42 0 8-3.58 8-8V191.36c0-2.67 3.23-4.01 5.12-2.12l9.48 9.48a7.994 7.994 0 0 0 11.04.26l32.37-29.43c3.29-2.99 3.51-8.1.48-11.36Zm-130.5-26.08h-.34.7H224.04Z" fill="#DD6A5A"></path><path d="m252.03 98.87-14.35 2.69a74.08 74.08 0 0 1-27.37 0l-14.35-2.69c-2.56-.48-5.17-.51-7.74-.09 1.36 18.63 16.85 33.32 35.78 33.32s34.41-14.69 35.78-33.32c-2.57-.42-5.18-.39-7.74.09h-.01Z" fill="#C03D37"></path><path d="m195.99 109.55 14.34 2.7c9.04 1.7 18.31 1.7 27.35 0l14.34-2.7c1.78-.33 3.58-.44 5.38-.33 1.27-3.27 2.09-6.77 2.35-10.43-2.56-.42-5.18-.39-7.73.09l-14.34 2.7c-9.04 1.7-18.31 1.7-27.35 0l-14.34-2.7c-2.55-.48-5.17-.51-7.73-.09.27 3.66 1.08 7.16 2.35 10.43 1.8-.1 3.61 0 5.38.33Z" fill="#CC5747"></path><path d="M232.38 112.11h-16.76a1.62 1.62 0 0 0-1.62 1.62v7.76c0 .895.725 1.62 1.62 1.62h16.76a1.62 1.62 0 0 0 1.62-1.62v-7.76a1.62 1.62 0 0 0-1.62-1.62Z" fill="#fff"></path><path d="M185.16 95.82c1.65-.29 3.18.86 3.45 2.52 2.73 17.09 17.53 30.16 35.39 30.16s32.66-13.06 35.39-30.16c.26-1.66 1.79-2.81 3.45-2.52l5.93 1.04c1.59.28 2.68 1.78 2.43 3.38-3.64 22.79-23.38 40.21-47.2 40.21-23.82 0-43.56-17.42-47.2-40.21-.25-1.6.84-3.1 2.43-3.38l5.93-1.04ZM95.82 155.74l-2.23 2.4c-3.03 3.26-2.81 8.37.48 11.36l32.37 29.43c3.16 2.87 8.02 2.76 11.04-.26l2.56-2.56-44.22-40.37Z" fill="#E8AF57"></path><path d="m354.541 158.19-33.31-35.87a59.971 59.971 0 0 0-32.2-18.01l-17.92-3.58c-.57 3.35-1.49 6.59-2.72 9.67l12.12 2.42a59.971 59.971 0 0 1 32.2 18.01l33.31 35.87c2.32 2.49 2.73 6.07 1.32 8.95l6.71-6.1c3.29-2.99 3.51-8.1.48-11.36h.01ZM293.9 195.51a74.154 74.154 0 0 0-10.11 51.02l.04.27c.53 3.19 1.18 6.58 1.84 10.38 1.52 8.8 2.26 17.72 2.26 26.65V295c0 14-9.37 26.26-22.87 29.95a89.888 89.888 0 0 1-42.54 1.17l-15.36-3.29a90.172 90.172 0 0 0-38.42.15l-16.73 3.73v1.41c0 4.42 3.58 8 8 8h128c4.42 0 8-3.58 8-8v-136l-2.1 3.4-.01-.01Z" fill="#E87E69"></path><path d="m352.26 155.74 2.23 2.4c3.03 3.26 2.81 8.37-.48 11.36l-32.37 29.43c-3.16 2.87-8.02 2.76-11.04-.26l-2.56-2.56 44.22-40.37Z" fill="#E8AF57"></path></g><defs><clipPath id="clip0_894_1529"><path fill="#fff" d="M0 0h448v448H0z"></path></clipPath></defs></svg>
											</div>
										</div>
										<div>
											<div>
												<h3>
													<a>제품명 예</a>
												</h3>
												<div>
													<div>
														<div>
															<span>₩20 KRW</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			<!-- 추천 컬렉션 끝-->
			<!-- 이미지 배너 시작점 -->	
				<div>
					<div>
						<div>
							<img src="//cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=3840" alt="" srcset="//cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=375 375w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=550 550w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=750 750w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=1100 1100w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=1500 1500w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=1780 1780w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=2000 2000w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=3000 3000w, //cdn.shopify.com/s/files/1/0645/3939/4240/files/i8281312671.jpg?v=1713952288&amp;width=3840 3840w" width="1076" height="561.0" sizes="100vw" fetchpriority="auto">
						</div>
						<div>
							<div>
								<h2>Protect your Vision</h2>
								<div>
									<a>Own it now</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!-- 이미지 배너 끝 -->
			</main>
			<!-- 템플릿 종료 -->
			
			<!-- 이메일 가입 시작-->
			<div id="email">
				<div>
					<h2>Subscribe to out emails</h2>
					<div></div>
					<div>
						<form>
							<div>
								<input type="email" />
								<label>이메일</label>
								<button>
									<svg viewBox="0 0 14 10" fill="none" aria-hidden="true" focusable="false" class="icon icon-arrow" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M8.537.808a.5.5 0 01.817-.162l4 4a.5.5 0 010 .708l-4 4a.5.5 0 11-.708-.708L11.793 5.5H1a.5.5 0 010-1h10.793L8.646 1.354a.5.5 0 01-.109-.546z" fill="currentColor">
										</path>
									</svg>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 이메일 가입 종료 -->
			
			<!-- 바닥글 시작 -->
			<div id="ft">
				<footer>
					<div>
						<div>
							<div class="floor_block">
								<h2 class="floor_main_text">INFO</h2>
								<div>
									<h6 class="floor_text_first">Our story</h6>
									<h6 class="floor_text_center">Careers</h6>
									<h6 class="floor_text_finish">Covid-19</h6>
								</div>
							</div>
							<div class="floor_block">
								<h2 class="floor_main_text">LEGAL</h2>
								<div>
									<p class="floor_text_first">Privacy</p>
									<p class="floor_text_finish">Terms</p>
								</div>
							</div>
							<div class="floor_block">
							<h2 class="floor_main_text">SUPPORT</h2>
								<div>
									<p class="floor_text_first">Contact</p>
									<p class="floor_text_center">Shipping</p>
									<p class="floor_text_finish">Return</p>
								</div></div>
							<div class="floor_block">
								<h2 class="floor_main_text">OTHERS</h2>
								<div>
									<p class="floor_text_first">My Account</p>
									<p class="floor_text_center">Reward Program</p>
									<p class="floor_text_finish">Wallpapers</p>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div>
							<div></div>
						</div>
						<div>
							<div>
								<small>
									© 2024, 
									<a>SPIGEN</a>
								</small>
								<small>Powered by Shopify</small>
							</div>
						</div>
					</div>
				</footer>
			</div>
			<!-- 바닥글 종료 -->
		</div>
		<div id="boad_4">
			<div>
				<div>
					<svg viewBox="0 0 20 20" class="Online-Store-UI-IconWrapper__Icon_1aflm"><path d="M3.5 6.25c0-1.519 1.231-2.75 2.75-2.75.414 0 .75.336.75.75s-.336.75-.75.75c-.69 0-1.25.56-1.25 1.25 0 .414-.336.75-.75.75s-.75-.336-.75-.75Z"></path><path fill-rule="evenodd" d="M3.5 9.25c0-.966.784-1.75 1.75-1.75h9.5c.966 0 1.75.784 1.75 1.75v1.5c0 .966-.784 1.75-1.75 1.75h-9.5c-.966 0-1.75-.784-1.75-1.75v-1.5Zm1.75-.25c-.138 0-.25.112-.25.25v1.5c0 .138.112.25.25.25h9.5c.138 0 .25-.112.25-.25v-1.5c0-.138-.112-.25-.25-.25h-9.5Z"></path><path d="M3.5 13.75c0 1.519 1.231 2.75 2.75 2.75.414 0 .75-.336.75-.75s-.336-.75-.75-.75c-.69 0-1.25-.56-1.25-1.25 0-.414-.336-.75-.75-.75s-.75.336-.75.75Z"></path><path d="M13.75 3.5c1.519 0 2.75 1.231 2.75 2.75 0 .414-.336.75-.75.75s-.75-.336-.75-.75c0-.69-.56-1.25-1.25-1.25-.414 0-.75-.336-.75-.75s.336-.75.75-.75Z"></path><path d="M13.75 16.5c1.519 0 2.75-1.231 2.75-2.75 0-.414-.336-.75-.75-.75s-.75.336-.75.75c0 .69-.56 1.25-1.25 1.25-.414 0-.75.336-.75.75s.336.75.75.75Z"></path><path d="M11.75 4.25c0 .414-.336.75-.75.75h-2c-.414 0-.75-.336-.75-.75s.336-.75.75-.75h2c.414 0 .75.336.75.75Z"></path><path d="M11 16.5c.414 0 .75-.336.75-.75s-.336-.75-.75-.75h-2c-.414 0-.75.336-.75.75s.336.75.75.75h2Z"></path></svg>
				</div>
				<div>
					<h2>템플릿 사용자 지정</h2>
					<p>
						<span>시작하려면 사이드바에서 섹션또는 블록<br/>을 선택합니다.</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>