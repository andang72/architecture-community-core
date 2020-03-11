<#ftl encoding="UTF-8"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Title -->
  <#assign PAGE_NAME = "Working with Pages" />	
  <#assign PARENT_PAGE_NAME = "가이드" />	  
  <#assign KENDO_VERSION = "2019.3.917" /> 
  <title>STUDIO :: ${PAGE_NAME} </title>
  <!-- Required Meta Tags Always Come First -->
  <meta name="decorator" content="<@spring.url "/decorators/studio/unify-decorator.jsp"/>">

  <!-- CSS Customization -->
  <link rel="stylesheet" href="<@spring.url "/css/community.ui.studio/custom.css"/>"> 
  <link rel="stylesheet" href="<@spring.url "/css/community.ui.studio/docs.min.css"/>"> 
    
  <!-- Kendo UI Professional Theme Nova -->
  <link rel="stylesheet" href="<@spring.url "/css/kendo/${KENDO_VERSION}/kendo.common.min.css"/>"> 
  <link rel="stylesheet" href="<@spring.url "/css/kendo/${KENDO_VERSION}/kendo.nova.min.css"/>"> 
  
 <!-- Application JavaScript
  		================================================== -->
  <script>		
	require.config({
		shim : {
			"jquery.cookie" 				: { "deps" :['jquery'] },
	        "bootstrap" 					: { "deps" :['jquery'] },
	        "jquery.fancybox" 				: { "deps" :['jquery'] },
	        "jquery.scrollbar" 				: { "deps" :['jquery'] },
	        "hs.core" 						: { "deps" :['jquery', 'jquery.cookie', 'bootstrap'] },
	        "hs.scrollbar" 					: { "deps" :['jquery', 'hs.core', 'jquery.scrollbar'] },
	        "hs.side-nav" 					: { "deps" :['jquery', 'hs.core'] },
	        "hs.focus-state" 				: { "deps" :['jquery', 'hs.core'] },
	        "hs.popup" 						: { "deps" :['jquery', 'hs.core', 'jquery.fancybox'] },
	        "hs.hamburgers" 				: { "deps" :['jquery', 'hs.core'] },
	        "hs.dropdown" 					: { "deps" :['jquery', 'hs.core'] },	 
	        "hs.scrollbar" 					: { "deps" :['jquery', 'hs.core'] },
	        <!-- Kendo UI Professional -->
	        "kendo.web.min" 				: { "deps" :['jquery', 'kendo.core.min', 'kendo.culture.min'] },
	        <!-- community ui -->
	        "community.ui.data" 			: { "deps" :['jquery', 'kendo.web.min'] },
	        "community.ui.core" 			: { "deps" :['jquery', 'kendo.web.min', 'community.ui.data'] },
	        "studio.custom" 				: { "deps" :['jquery', 'bootstrap', 'hs.core', 'kendo.web.min', 'community.ui.data' , 'community.ui.core' ] }
		},
		paths : {
			"jquery"    					: "<@spring.url "/js/jquery/jquery-3.4.1.min"/>",
			"jquery.cookie"    				: "<@spring.url "/js/jquery.cookie/1.4.1/jquery.cookie"/>",
			"jquery.fancybox" 				: "<@spring.url "/js/jquery.fancybox/jquery.fancybox.min"/>",
			"jquery.scrollbar" 				: "<@spring.url "/assets/unify.admin/2.6.2/vendor/malihu-scrollbar/jquery.mCustomScrollbar.concat.min"/>",
			"bootstrap" 					: "<@spring.url "/js/bootstrap/4.3.1/bootstrap.bundle.min"/>",
			"hs.core" 						: "<@spring.url "/assets/unify/2.6.2/js/hs.core"/>", 
			"hs.hamburgers" 				: "<@spring.url "/assets/unify/2.6.2/js/helpers/hs.hamburgers"/>",
			"hs.dropdown" 					: "<@spring.url "/assets/unify/2.6.2/js/components/hs.dropdown"/>",
			"hs.scrollbar" 					: "<@spring.url "/assets/unify/2.6.2/js/components/hs.scrollbar"/>",
			"hs.focus-state" 				: "<@spring.url "/assets/unify/2.6.2/js/helpers/hs.focus-state"/>",
			"hs.side-nav" 					: "<@spring.url "/assets/unify.admin/2.6.2/js/components/hs.side-nav"/>",
			"hs.popup" 						: "<@spring.url "/assets/unify.admin/2.6.2/js/components/hs.popup"/>",
			"studio.custom" 				: "<@spring.url "/js/community.ui.studio/custom"/>",
			<!-- Kendo UI Professional -->
			"kendo.core.min"				: "<@spring.url "/js/kendo/${KENDO_VERSION}/kendo.core.min"/>",
			"kendo.web.min"	 				: "<@spring.url "/js/kendo/${KENDO_VERSION}/kendo.web.min"/>", 
			"kendo.culture.min"				: "<@spring.url "/js/kendo/${KENDO_VERSION}/cultures/kendo.culture.ko-KR.min"/>", 
			"jszip"							: "<@spring.url "/js/kendo/${KENDO_VERSION}/jszip.min"/>",
			<!-- community ui -->
			"community.ui.data"				: "<@spring.url "/js/community.ui/community.ui.data"/>",
			"community.ui.core"	 			: "<@spring.url "/js/community.ui/community.ui.core"/>"
		}
	});		
  	require([ "jquery", "bootstrap", "hs.side-nav", "hs.hamburgers" , "hs.dropdown" , "jquery.scrollbar", "hs.scrollbar" , "hs.popup", "studio.custom" ], function($) {  
  	  console.log("START SETUP APPLICATION.");	
  	  community.ui.studio.setup();	
  	  console.log("END SETUP APPLICATION.");	
  	});	
  </script>
</head>    		
<body data-spy="scroll" data-target=".guide-navbar" data-offset="50" >
  <main class="container-fluid px-0 g-pt-65">
    <div class="row no-gutters g-pos-rel g-overflow-x-hidden"> 
	  <#include "../includes/sidebar.ftl"> 
      <div class="col g-ml-45 g-ml-0--lg g-pb-65--md"> 
        <!-- Breadcrumb-v1 -->
        <div class="g-hidden-sm-down g-bg-gray-light-v8 g-pa-20">
          <ul class="u-list-inline g-color-gray-dark-v6"> 
            <li class="list-inline-item g-mr-10">
              <a class="u-link-v5 g-color-gray-dark-v6 g-color-secondary--hover g-valign-middle" href="#!">${PARENT_PAGE_NAME} </a>
              <i class="hs-admin-angle-right g-font-size-12 g-color-gray-light-v6 g-valign-middle g-ml-10"></i>
            </li> 
            <li class="list-inline-item">
                <span class="g-valign-middle">${PAGE_NAME}</span>
            </li>
          </ul>
        </div>
        <!-- End Breadcrumb-v1 -->  
        <div class="g-pa-20">
          <h1 class="g-font-weight-300 g-font-size-28 g-color-black g-mb-30">${PAGE_NAME}</h1> 
          <!-- Content -->
		  <div id="features" class="container-fluid">
			<div class="row flex-xl-nowrap"> 
	          <nav class="d-none d-xl-block col-xl-2 bd-toc guide-navbar" aria-label="Secondary navigation">
				<ul class="section-nav">
					<li class="toc-entry toc-h2"><a href="#guide-1">What is Page</a> 
					</li>
					<li class="toc-entry toc-h2"><a href="#guide-2">약속된 Page 이름들</a></li>
					<li class="toc-entry toc-h2"><a href="#guide-3">Page를 구성하는 것들</a> 
						<ul>
							<li class="toc-entry toc-h2"><a href="#guide-3-1">View Groovy Script</a>
							<li class="toc-entry toc-h2"><a href="#guide-3-2">View Template or JSP</a>
						</ul> 
					</li>
					<li class="toc-entry toc-h2"><a href="#guide-4">Using Decorator</a></li>
					<li class="toc-entry toc-h2"><a href="#guide-5">Using Service</a></li>
	         	</nav> 
				<main class="col-12 col-md-9 col-xl-10 py-md-3 pl-md-5 bd-content" role="main"> 
					<div class="u-heading-v2-3--bottom g-mb-30">
                      <h2 class="u-heading-v2__title g-mb-10" id="guide-1">What is Page</h2>
                      <h4 class="g-font-weight-200 g-mb-10"></h4>
                    </div>
					<p>Page 는 Spring Controller 과 유사한 기능을 제공하며 새로운 UI 화면을 위하여 사용된다. <a href="<@spring.url"/secure/studio/resource-pages"/>" data-menu-item="SIDEBAR_05_01"  class="btn btn-sm u-btn-outline-red g-mr-15 g-mb-5" >페이지 메뉴 바로가기</a></p> 
					<p>
					Page 는 다음과같은 형식의 URL 경로로 호출된다. 예를 들어 Page 이름이 test.html 라면 <span class="g-color-primary"><@spring.url "/display/pages/"/>test.html</span> 
					또는 <span class="g-color-primary"><@spring.url "/display/view/"/>test.html</span> URL 을 갖게된다. 
					Pattern 규칙이 존재하는 경우 패턴의 규칙에 따른 URL 호출도 가능하다.
					</p> 
<pre><code class="language-java g-font-size-11"><@spring.url "/display/pages/"/>[Page 이름] or <@spring.url "/display/view/"/>[Page 이름]</code></pre>
					 
<hr>			
					<div class="u-heading-v5-2 g-mb-20">
					  <h2 class="text-uppercase h5 u-heading-v5__title" id="guide-2" >이미 약속된 특별한 Page 이름들</h2>
					</div>
                    <p>어떤 Page 이름들은 특별한 목적을 가지고 있다. 예를 들어 기본으로 제공되는 메인 페이지는 index.html 이름의 Page 를 생성하여 메인 페이지를 사용자화 할 수있다.</p>

					<div class="table-responsive">
					  <table class="table table-striped">
					    <thead>
					      <tr>
					        <th>#</th>
					        <th>Page</th>
					        <th class="hidden-sm">URL</th>
					        <th>설명</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td>1</td>
					        <td>index.html</td>
					        <td class="hidden-sm">/index.html</td>
					        <td>페이지 이름 <span class="g-color-primary">index.html</span> 는 디폴트 메인 페이지를 대체.</td>
					      </tr>
					      <tr>
					        <td>2</td>
					        <td>login.html</td>
					        <td class="hidden-sm">/accounts/login</td>
					        <td>페이지 이름 <span class="g-color-primary">login.html</span> 는 디폴트 로그인 페이지를 대체.</td>
					      </tr>     
					      <tr>
					        <td>3</td>
					        <td>join.html</td>
					        <td class="hidden-sm">/accounts/join, /accounts/signup</td>
					        <td>페이지 이름 <span class="g-color-primary">login.html</span> 는 디폴트 회원가입 페이지를 대체.</td>
					      </tr>       
					    </tbody>
					  </table>
					</div>
					<hr>		
					<div class="u-heading-v5-2 g-mb-20">
					  <h2 class="text-uppercase h5 u-heading-v5__title" id="guide-3" >Page 를 구성하는 것들</h2>
					</div> 	
					<p>Page 는 ❶ Groovy 기반의 View Script , ❷ Freemarker 기반의 Content Body or Templage 로 구성된다. 이 두가지를 사용하여 화면을 구성하는 HTML 을 생성할 수 있다.
					<img class="img-fluid" src="<@spring.url "/images/guide/guide_page_01.png"/>"/>
					</p>
					
					<p>
					<span class="g-color-primary">❶ View Script</span>는 화면 구현을 위하여 필요한 데이터를 추출하여 View 페이지에 전달하는 기능을 제공한다.
					<span class="g-color-primary">❷ Template</span>는 화면을 구현하기 위한 HTML 생성을 위한 View 페이지를 의미하며 JSP 와 Freemarker 를 지원하고 있다.
					Template 값은 JSP 또는 Freemarker 페이지 경로 또는  redirect:/xxx/xx, forward:/xxx/xx 와 같은 명령을 사용하는 것도 가능하다.
					JSP/Freemaker 템플릿을 사용하지 않고 Page 의 <span class="g-color-primary"> ❷ Content Body </span> 를 사용하여 HTML을 생성할 수도 있다. 디폴트로 Content Body 는 Freemarker 를 지원한다.
					</p>  
					
					<div class="u-heading-v5-2 g-mb-20">
					  <h2 class="text-uppercase h5 u-heading-v5__title" id="guide-3-1" >View Groovy Script</h2>
					</div>
					<p>
					Spring Controller 는 단순 요청에대한 뷰(View) 페이지 매핑 뿐아니라 뷰에서 사용하게되는 다양한 데이터를 추출하여 전달하는 역할을 하기도 한다. (Push Design Style)
					Page 의 경우는 Groovy 기반의 서버스크립트를 사용하여 이러한 작업을 지원하고 있다. 
					</p>
					
					<p>
					개발의 편의성을 위하여 Page 에서 사용하는 Groovy 스크립트는 <span class="g-color-primary">architecture.community.web.spring.view.script.AbstractPageView</span> 추상을 상속받아 구현하며, 추상 함수 renderMergedOutputModel 를 구현해야 한다. 
					View 에서 사용하는 데이터는 model 데이터에 넣어 전달한다.
					</p>
					<pre><code class="language-java g-font-size-12">protected abstract void renderMergedOutputModel( Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception;</code></pre>
					<p>AbstractPageView 를 통하여 제공되는 주요한 함수는 아래와 같다.</p>
					<div class="table-responsive">
					  <table class="table table-striped">
					    <thead>
					      <tr> 
					        <th>Method</th> 
					        <th>Description</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr> 
					        <td><code>protected boolean isMultipartHttpServletRequest(HttpServletRequest request)</code></td> 
					        <td>멀티파트 여부를 리턴</td>
					      </tr> 
					      <tr> 
					        <td><code>protected MultipartHttpServletRequest getMultipartHttpServletRequest(HttpServletRequest request) </code></td> 
					        <td>HttpServletRequest 객체를 MultipartHttpServletRequest 로 케스팅하여 리턴</td>
					      </tr> 
					      <tr> 
					        <td><code>protected User getUser() </code></td> 
					        <td>인증된 사용자 객체를 리턴</td>
					      </tr> 	
					      <tr> 
					        <td><code>protected boolean isUserInRole(String roles)</code> </td> 
					        <td>전달된 롤에 해당하는지 여부를 리턴
					        <br/> 
					        <p class="text-muted">다수의 롤인 경우 ROLE_USER, ROLE_ADMIN 과 같이 , 로 구분.</p></td>
					      </tr> 	
					      <tr> 
					        <td><code>protected DataSourceRequest getDataSourceRequest(HttpServletRequest request) </code></td> 
					        <td>HttpServletRequest 에서 DataSourceRequest 생성.<br/> 
					        <p class="text-muted">Body에 JSON 형식의 데이터 요구됨.<p></td>
					      </tr>
					      <tr> 
					        <td><code>protected <T> T getRequestBodyObject(Class<T> requiredType, HttpServletRequest request)</code></td> 
					        <td>HttpServletRequest 에서 requiredType 클래스 객체생성
					        <p class="text-muted">Body에 JSON 데이터가 requiredType 클래스와 일치해야함.<p>
					        </td>
					      </tr> 
					      <tr> 
					        <td><code>protected Page getPage(Map<String, ?> model)</code></td> 
					        <td>renderMergedOutputModel 함수를 통하여 전달된 model 객체에서 Page 객체를 리턴한다.</td>
					      </tr> 
					      <tr> 
					        <td><code>protected Map<String, ?> getVariables(Map<String, ?> model)</code></td> 
					        <td>
					        renderMergedOutputModel 함수를 통하여 전달된 model 객체에서 pattern 에 해당하는 값들을 리턴한다.<br/>
					        이 함수는 pattern 호출인 경우 동작하며, path 변수값을 포함하는 Map 객체롤 리턴한다. 
					        </td>
					      </tr> 
					      <tr> 
					        <td><code>protected CustomQueryJdbcDao createCustomQueryJdbcDao(String dataSource)</code></td> 
					        <td>
					        새로운 CustomQueryJdbcDao 객체를 생성하여 리턴한다. <p class="text-muted">(Transaction 를 지원하지 않음)</p>
					        </td>
					      </tr> 					      					      					      					       						      					      				      					         
					    </tbody>
					  </table>
					</div>					
															
					<hr>
					<div class="u-heading-v5-2 g-mb-20">
					  <h2 class="text-uppercase h5 u-heading-v5__title" id="guide-3-2" >View Template or JSP </h2>
					</div>
					<p>템플릿(Template)은 HTML 페이지를 구현하는 프로그램을 의미한다. 
					페이지(Page) 는 JSP 또는 Freemarker (FTL) 형태의 템플릿을 지정하여 사용할 수 있다. 템플릿 파일들은 웹 브라우져를 통하여 직접 호출 할 수 없고, 
					페이지를 생성하고 템플릿 경로를 지정한 다음 페이지를 호출을 통하여 템플릿이 만들어 내는 최종 화면을 확인 할 수 있다.</p>
					
					<p> 페이지를 구현하는 뷰(JSP/FTL)에는 특별한 작업을 수행하지 않아도 <span class="g-color-primary">Page</span> 와 <span class="g-color-primary">User</span> 객체가 전달된다.
					데이터 조작과 전달이 필요한 경우는 <span class="g-color-primary">Groovy</span> 기반의 스크립트를 지정하여 사용한다.</p>	 
<pre><code class="language-html g-font-size-12">// ① FTL 					
&lt;!DOCTYPE html>
&lt;html lang="en"&gt;
	&lt;head&gt;
		&lt;title><&num;if __page??>&dollar;{__page.title}</&num;if> &lt;/title&gt;
	&lt;/head&gt;
	&lt;body&gt;
	
&lt;/html&gt;</code></pre>						
					
<pre><code class="language-java g-font-size-12">// ② JSP 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="architecture.community.page.Page, 
	architecture.community.user.User,
	architecture.community.util.SecurityHelper,
	architecture.community.web.util.ServletUtils,
	architecture.community.util.CommunityContextHelper"%>
<%
	Page __page = (Page) request.getAttribute("__page");
	User __user = SecurityHelper.getUser();
%>									
					</code></pre>						
					
					<hr/>					
					<div class="u-heading-v5-2 g-mb-20">
					  <h2 class="text-uppercase h5 u-heading-v5__title" id="guide-4" >Using Decorator</h2>
					</div>
					<p>Template 에서는 Sitemesh3 기반의 Decorator 를 사용할 수 있다. </p>
					<p>Decorator 사용은 meta 태그에 아래와 같이 사용하는 Decorator 의 경로를 헤더에 추가하기만 하면 된다.</p>
<pre class="hljs" style="display: block; overflow-x: auto; padding: 0.5em; background: rgb(51, 51, 51); color: rgb(255, 255, 255);">	&lt;head&gt;
	<span class="xml"><span class="hljs-tag" style="color: rgb(98, 200, 243);">&lt;<span class="hljs-name" style="font-weight: 700;">title</span>&gt;</span>페이지 제목<span class="hljs-tag" style="color: rgb(98, 200, 243);">&lt;/<span class="hljs-name" style="font-weight: 700;">title</span>&gt;</span></span> 
	&lt;meta name=<span class="hljs-string" style="color: rgb(162, 252, 162);">"decorator"</span> content=<span class="hljs-string" style="color: rgb(162, 252, 162);">"&lt;@spring.url "</span><span data-bind="text:path">/decorators/bootstrap-decorator.jsp</span><span class="hljs-string" style="color: rgb(162, 252, 162);">"/&gt;"</span>&gt;
	<span class="xml"><span class="hljs-tag" style="color: rgb(98, 200, 243);">&lt;/<span class="hljs-name" style="font-weight: 700;">head</span>&gt;</span></span></pre>
				    <hr>

					<!-- Using Service -->
					<div class="u-heading-v5-2 g-mb-20">
					  <h2 class="text-uppercase h5 u-heading-v5__title" id="guide-5" >Using Service</h2>
					  <p>뷰 템플릿에서 서비스 객체들을 직접 사용할 수 도 있다. </p> 
					  <p>
					   서비스 객체는 <span class="g-color-primary">architecture.community.util.CommunityContextHelper</span> 클래스의 <span class="g-color-primary">getComponent()</span> 함수를 사용하 접근 할 수 있다.
					  </p>
<pre><code class="language-java g-font-size-12">

import architecture.community.util.CommunityContextHelper;
import architecture.community.page.PageService ;

PageService pageService = CommunityContextHelper.getComponent("pageService", PageService.class);
// 단일 객체의 경우 클래스만으로 꺼낼 수 있다. 
// PageService pageService = CommunityContextHelper.getComponent(PageService.class);
</code></pre>		
 <p>다음은 이용이 가능한 서비스 목록이다.</p>
<!-- Table Head Option -->
<div class="table-responsive">
  <table class="table">
    <thead>
      <tr class="thead-inverse">
        <th>#</th>
        <th>Class</th> 
        <th>Bean Name</th>
        <th>Usage</th>
      </tr>
    </thead> 
    <tbody> 

      <tr>
        <td>1</td>
        <td>architecture.community.user.UserManager</td> 
        <td>userManager</td>
        <td> CommunityContextHelper.getComponent("userManager", UserManager.class);
        </td>
      </tr>
      <tr>
        <td>2</td>
        <td>architecture.community.page.PageService</td> 
        <td>pageService</td>
        <td> 
        </td>
      </tr>      
      <tr>
        <td>3</td>
        <td>architecture.community.image.ImageService</td> 
        <td>imageService</td>
        <td> 
        </td>
      </tr>   
      <tr>
        <td>4</td>
        <td>architecture.community.attachment.AttachmentService</td> 
        <td>attachmentService</td>
        <td> 
        </td>
      </tr>        
      <tr>
        <td>5</td>
        <td>architecture.community.viewcount.ViewCountService</td> 
        <td>viewCountService</td>
        <td> 
        </td>
      </tr>  
      <tr>
        <td>6</td>
        <td>architecture.community.tag.TagService</td> 
        <td>tagService</td>
        <td> 
        </td>
      </tr>  
      <tr>
        <td>7</td>
        <td>architecture.community.comment.CommentService</td> 
        <td>commentService</td>
        <td> 
        </td>
      </tr>        
      <tr>
        <td>8</td>
        <td>architecture.community.announce.AnnounceService</td> 
        <td>announceService</td>
        <td> 
        </td>
      </tr>  
      <tr>
        <td>9</td>
        <td>architecture.community.navigator.menu.MenuService</td> 
        <td>menuService</td>
        <td> 
        </td>
      </tr>                                          
    </tbody>
  </table> 
</div>
<!-- End Table Head Option -->
			  			  
					</div>	
					<!-- End Using Service -->					
				</main>
			</div>
		  </div>         
          <!-- End Content --> 
          
        </div>
		<#include "../includes/footer.ftl"> 
      </div>
    </div>
  </main>
</body>
</html>