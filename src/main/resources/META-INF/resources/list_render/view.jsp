<%@ include file="/META-INF/resources/init.jsp" %>

<%
    CPContentHelper cpContentHelper = (CPContentHelper) request.getAttribute(CPContentWebKeys.CP_CONTENT_HELPER);
    CPDataSourceResult cpDataSourceResult = (CPDataSourceResult) request.getAttribute(CPWebKeys.CP_DATA_SOURCE_RESULT);
    CommerceContext commerceContext = (CommerceContext) request.getAttribute(CommerceWebKeys.COMMERCE_CONTEXT);
%>

<c:choose>
    <c:when test="<%= !cpDataSourceResult.getCPCatalogEntries().isEmpty() %>">
        <div class="product-card-tiles">
            <%
                for (CPCatalogEntry cpCatalogEntry : cpDataSourceResult.getCPCatalogEntries()) {
                    CPSku cpSku = cpContentHelper.getDefaultCPSku(cpCatalogEntry);
                    String addToCartId = PortalUtil.generateRandomKey(request, "add-to-cart");
                    String productDetailURL = cpContentHelper.getFriendlyURL(cpCatalogEntry, themeDisplay);
            %>
            <div class="cp-renderer">
                <div class="card d-flex flex-column product-card">
                    <div class="card-item-first position-relative">
                        <div class="card-body d-flex flex-column justify-content-between py-2">
                            <a href="<%= productDetailURL %>">
                                <liferay-adaptive-media:img
                                    class="img-fluid product-card-picture"
                                    fileVersion="<%= cpContentHelper.getCPDefinitionImageFileVersion(cpCatalogEntry.getCPDefinitionId(), request) %>"
                                />
                            </a>
                            <div class="cp-information">
                                <a href="<%= productDetailURL %>">
                                    <h1><%= HtmlUtil.escape(cpCatalogEntry.getName()) %></h1>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </c:when>
    <c:otherwise>
        <div class="alert alert-info">
            <liferay-ui:message key="no-products-were-found"/>
        </div>
    </c:otherwise>
</c:choose>
