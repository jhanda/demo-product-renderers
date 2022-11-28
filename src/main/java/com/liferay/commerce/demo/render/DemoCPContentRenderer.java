package com.liferay.commerce.demo.render;

import com.liferay.commerce.product.catalog.CPCatalogEntry;
import com.liferay.commerce.product.content.render.CPContentRenderer;
import com.liferay.commerce.product.type.grouped.constants.GroupedCPTypeConstants;
import com.liferay.commerce.product.type.simple.constants.SimpleCPTypeConstants;
import com.liferay.commerce.product.type.virtual.constants.VirtualCPTypeConstants;
import com.liferay.frontend.taglib.servlet.taglib.util.JSPRenderer;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.util.ResourceBundleUtil;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 * @author Jeff Handa
 */
@Component(
        immediate = true,
        property = {
                "commerce.product.content.renderer.key=" + DemoCPContentRenderer.KEY,
                "commerce.product.content.renderer.order=" + Integer.MIN_VALUE + 10,
                "commerce.product.content.renderer.type=" + GroupedCPTypeConstants.NAME,
                "commerce.product.content.renderer.type=" + SimpleCPTypeConstants.NAME,
                "commerce.product.content.renderer.type=" + VirtualCPTypeConstants.NAME
        },
        service = CPContentRenderer.class
)
public class DemoCPContentRenderer implements CPContentRenderer {

    public static final String KEY = "demo-product-renderer";

    @Override
    public String getKey() {
        return KEY;
    }

    @Override
    public String getLabel(Locale locale) {
        ResourceBundle resourceBundle = ResourceBundleUtil.getBundle(
                "content.Language", locale, getClass());

        return LanguageUtil.get(resourceBundle, "demo-product-renderer");
    }

    @Override
    public void render(CPCatalogEntry cpCatalogEntry, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        _jspRenderer.renderJSP(
                _servletContext, httpServletRequest, httpServletResponse,
                "/render/view.jsp");
    }

    @Reference(
            target = "(osgi.web.symbolicname=com.liferay.commerce.demo.render)"
    )
    private ServletContext _servletContext;

    @Reference
    private JSPRenderer _jspRenderer;
}