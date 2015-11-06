package silver.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

/**
 * Application Lifecycle Listener implementation class SilverListener
 *
 */
@WebListener
public class SilverListener extends ContextLoaderListener implements ServletContextListener {
	
}
