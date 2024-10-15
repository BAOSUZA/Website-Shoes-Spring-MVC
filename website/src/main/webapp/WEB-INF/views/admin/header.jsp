<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DABOTING</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="${pageContext.servletContext.contextPath}/assets/user/images/user/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">${sessionScope.fullname}</h6>
                        <span>Admin</span>
                    </div>	
                </div>
                <div class="navbar-nav w-100">
                    <a href="${pageContext.servletContext.contextPath}/management/home" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Trang chủ</a>
                    <a href="${pageContext.servletContext.contextPath}/management/account" class="nav-link dropdown-toggle" ><i class="far fa-file-alt me-2"></i>Quản lý tài khoản</a>
                    <a href="${pageContext.servletContext.contextPath}/management/order" class="nav-link dropdown-toggle" ><i class="fa fa-keyboard me-2"></i>Quản lý đơn hàng</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-keyboard me-2"></i>Quản lý danh mục</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.servletContext.contextPath}/management/category" class="dropdown-item">Tất cả danh mục</a>
                            <a href="${pageContext.servletContext.contextPath}/management/view-add-category" class="dropdown-item">Thêm danh mục</a>

                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-keyboard me-2"></i>Quản lý sản phẩm</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="${pageContext.servletContext.contextPath}/management/product" class="dropdown-item">Tất cả sản phẩm</a>
                            <a href="${pageContext.servletContext.contextPath}/management/view-add-product" class="dropdown-item">Thêm sản phẩm</a>
                        </div>
                    </div>
                    <a href="${pageContext.servletContext.contextPath}/home" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Trở về trang chủ</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Tìm kiếm">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Thông báo</span>
                        </a>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="${pageContext.servletContext.contextPath}/assets/user/images/user/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex"><?= $userName ?></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">Thông tin tài khoản</a>
                            <a href="#" class="dropdown-item">Cài đặt</a>
                            <a href="#" class="dropdown-item">Trở về trang chủ</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->