<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<footer>
                    <div class="footer clearfix mb-0 text-muted">
                        <div class="float-start">
                            <p>2022 &copy; PMS</p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>
    <script src="${path}/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${path}/resources/js/bootstrap.bundle.min.js"></script>
    
	<script src="${path}/resources/vendors/apexcharts/apexcharts.js"></script>
	<script src="${path}/resources/js/pages/dashboard.js"></script>
	<script src="${path}/resources/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	
	<script src="${path}/resources/js/extensions/sweetalert2.js"></script>
	<script src="${path}/resources/vendors/sweetalert2/sweetalert2.all.min.js"></script>
	
    <script src="${path}/resources/js/mazer.js"></script>
    </body>
</html>