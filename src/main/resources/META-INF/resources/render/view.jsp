<%@ include file="/META-INF/resources/init.jsp" %>

<%
    CPContentHelper cpContentHelper = (CPContentHelper)request.getAttribute(CPContentWebKeys.CP_CONTENT_HELPER);
    CommerceContext commerceContext = (CommerceContext)request.getAttribute(CommerceWebKeys.COMMERCE_CONTEXT);
    CPCatalogEntry cpCatalogEntry = cpContentHelper.getCPCatalogEntry(request);
    CPSku cpSku = cpContentHelper.getDefaultCPSku(cpCatalogEntry);
    long cpDefinitionId = cpCatalogEntry.getCPDefinitionId();
    String addToCartId = PortalUtil.generateRandomKey(request, "add-to-cart");
%>

<h1><%= HtmlUtil.escape(cpCatalogEntry.getName()) %></h1>

<div class="col-12 col-md-6">
    <commerce-ui:gallery
            CPDefinitionId="<%= cpDefinitionId %>"
            namespace="<%= liferayPortletResponse.getNamespace() %>"
    />
</div>
