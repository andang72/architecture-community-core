package architecture.community.web.spring.controller.page;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.HandlerMapping;

import architecture.community.exception.NotFoundException;
import architecture.community.web.util.ServletUtils;
import architecture.ee.service.ConfigService;

/**
 * 
 * Studio Page Controller ..
 * Only Access allowed to "ROLE_ADMINISTRATOR" , "ROLE_DEVELOPER"
 * 
 * 
 * 
 * @author donghyuck
 *
 */
@Controller("community-secure-studio-controller")
@RequestMapping("/secure/studio")
public class SecuredStudioPageController {

	public SecuredStudioPageController() {
	}

	private static final Logger log = LoggerFactory.getLogger(SecuredStudioPageController.class);
	
	@Autowired(required=false)
    @Qualifier("configService")
    private ConfigService configService;
	
	
	@Secured({ "ROLE_ADMINISTRATOR", "ROLE_SYSTEM", "ROLE_DEVELOPER"})
	@RequestMapping(value={"/", "/index"}, method = { RequestMethod.POST, RequestMethod.GET })
    public String index(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Model model) throws NotFoundException, IOException {	
		String view = "/studio/index";
		ServletUtils.setContentType(ServletUtils.DEFAULT_HTML_CONTENT_TYPE, response);	 
		return view;
    }
	
	@Secured({ "ROLE_ADMINISTRATOR", "ROLE_SYSTEM", "ROLE_DEVELOPER"})
	@RequestMapping(value = "/**", method = { RequestMethod.POST, RequestMethod.GET })
    public String page(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Model model) throws NotFoundException, IOException {		
		ServletUtils.setContentType(ServletUtils.DEFAULT_HTML_CONTENT_TYPE, response);	 
		String restOfTheUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);		
		String lcStr = restOfTheUrl.substring(8).toLowerCase(); 
		log.debug("view {} > {} .", restOfTheUrl, lcStr );
		return lcStr;
    }
	
}
