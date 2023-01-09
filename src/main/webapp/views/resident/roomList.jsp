<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>은빛 우산</title>

            <link rel="preconnect" href="https://fonts.gstatic.com">
            <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="assets/css/bootstrap.css">
            <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

            <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
            <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
            <link rel="stylesheet" href="assets/css/app.css">
            <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">

        </head>

        <body>
            <div id="app">
                <jsp:include page="../sidebar.jsp"></jsp:include>
                <div id="main">
                    <jsp:include page="../upbar.jsp"></jsp:include>

                    <div class="page-heading">
                        <h3>생활실 현황판</h3>

                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#roomInsert">
                            생활실 등록
                        </button>
                        <!-- <a href="#" class="btn btn-primary">생활실 등록</a> -->
                    </div>


                    <!-- Table head options start -->
                    <section class="section">
                        <div class="row" id="table-head">
                            <div class="col-12">
                                <div class="card">


                                    <div class="card-header">
                                        <h4 class="card-title">1층</h4>

                                        <div class="card-content row">

                                            
                                            <div class="table-responsive col-md-3">
                                                <!-- div 에 id 주고 추가 눌렀을 경우 ajax로-->
                                                <table class="table mb-0">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>진달래실&nbsp&nbsp<span
                                                                    style="font-size: x-small;">담당자:홍길동</span></th>

                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr>
                                                            <td class="text-bold-500">김아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">이아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">박아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">최아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">민아무개</td>
                                                        </tr>
                                                    </tbody>

                                                    <tfoot>
                                                        <tr>
                                                            <td>
                                                                <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                                                    data-bs-target="#roomUpdate">
                                                                    생활실 수정
                                                                </button>
                                                                <!-- <a href="#" class="btn btn-primary">생활실 수정</a> -->
                                                            </td>
                                                            <td>
                                                                <p>6/6</p>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                    <hr>



                                    <div class="card-header">
                                        <h4 class="card-title">2층</h4>

                                        <div class="card-content row">

                                            <div class="table-responsive col-md-3">
                                                <!-- div 에 id 주고 추가 눌렀을 경우 ajax로-->
                                                <table class="table mb-0">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>진달래실&nbsp&nbsp<span
                                                                    style="font-size: x-small;">담당자:홍길동</span></th>

                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr>
                                                            <td class="text-bold-500">김아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">이아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">박아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">최아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">민아무개</td>
                                                        </tr>
                                                    </tbody>

                                                    <tfoot>
                                                        <tr>
                                                            <td>
                                                                <a href="#" class="btn btn-primary">생활실 수정</a>
                                                            </td>
                                                            <td>
                                                                <p>6/6</p>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>


                                            <div class="table-responsive col-md-3">
                                                <table class="table mb-0">
                                                    <thead class="thead-dark">
                                                        <tr>
                                                            <th>진달래실</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <tr>
                                                            <td class="text-bold-500">김아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">이아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">박아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">최아무개</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-bold-500">민아무개</td>
                                                        </tr>
                                                    </tbody>

                                                    <tfoot>
                                                        <tr>
                                                            <td>
                                                                <a href="#" class="btn btn-primary">생활실 수정</a>
                                                            </td>
                                                            <td>
                                                                <p>6/6</p>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>







                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Table head options end -->




                    <!-- 생활실 등록 Modal -->
                    <div class="modal fade" id="roomInsert" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">생활실 등록</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <section class="section">
                                        <div class="card">
                                            

                                            <div class="card-header">
                                                <h4 class="card-title">Basic Inputs</h4>
                                            </div>
                    
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="floor">floor</label>
                                                            <input type="text" class="form-control" id="floor"
                                                                placeholder="층을 입력해주세요">
                                                        </div>
                    
                                                        <div class="form-group">
                                                            <label for="helpInputTop">Input text with help</label>
                                                            <small class="text-muted">eg.<i>someone@example.com</i></small>
                                                            <input type="text" class="form-control" id="helpInputTop">
                                                        </div>
                    
                                                        <div class="form-group">
                                                            <label for="helperText">With Helper Text</label>
                                                            <input type="text" id="helperText" class="form-control" placeholder="Name">
                                                            <p><small class="text-muted">Find helper text here for given textbox.</small>
                                                            </p>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="disabledInput">Disabled Input</label>
                                                            <input type="text" class="form-control" id="disabledInput"
                                                                placeholder="Disabled Text" disabled>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="disabledInput">Readonly Input</label>
                                                            <input type="text" class="form-control" id="readonlyInput" readonly="readonly"
                                                                value="You can't update me :P">
                                                        </div>
                    
                                                        <div class="form-group">
                                                            <label for="disabledInput">Static Text</label>
                                                            <p class="form-control-static" id="staticInput">email@mazer.com</p>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 생활실 등록 Modal END-->



                    <!-- 생활실 수정 Modal-->
                    <div class="modal fade" id="roomUpdate" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">생활실 등록</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <section class="section">
                                        <div class="card">
                                            

                                            <div class="card-header">
                                                <h4 class="card-title">Basic Inputs</h4>
                                            </div>
                    
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="floor">floor</label>
                                                            <input type="text" class="form-control" id="floor"
                                                                placeholder="층을 입력해주세요">
                                                        </div>
                    
                                                        <div class="form-group">
                                                            <label for="helpInputTop">Input text with help</label>
                                                            <small class="text-muted">eg.<i>someone@example.com</i></small>
                                                            <input type="text" class="form-control" id="helpInputTop">
                                                        </div>
                    
                                                        <div class="form-group">
                                                            <label for="helperText">With Helper Text</label>
                                                            <input type="text" id="helperText" class="form-control" placeholder="Name">
                                                            <p><small class="text-muted">Find helper text here for given textbox.</small>
                                                            </p>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="disabledInput">Disabled Input</label>
                                                            <input type="text" class="form-control" id="disabledInput"
                                                                placeholder="Disabled Text" disabled>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="disabledInput">Readonly Input</label>
                                                            <input type="text" class="form-control" id="readonlyInput" readonly="readonly"
                                                                value="You can't update me :P">
                                                        </div>
                    
                                                        <div class="form-group">
                                                            <label for="disabledInput">Static Text</label>
                                                            <p class="form-control-static" id="staticInput">email@mazer.com</p>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 생활실 수정 Modal END-->


                    <!--footer-->
                    <footer>
                        <div class="footer clearfix mb-0 text-muted">
                            <div class="float-start">
                                <p>2023 Final Project</p>
                            </div>
                            <div class="float-end">
                                <p>Create With <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                        href="http://ahmadsaugi.com">Gudi</a></p>
                            </div>
                        </div>
                    </footer>
                    <!--footer-->
                </div>
            </div>
            <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <script src="assets/vendors/apexcharts/apexcharts.js"></script>
            <script src="assets/js/pages/dashboard.js"></script>
            <script src="assets/js/main.js"></script>
        </body>

        </html>