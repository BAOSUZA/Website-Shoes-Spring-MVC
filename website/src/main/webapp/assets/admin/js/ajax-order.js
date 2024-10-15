$(document).ready(function () {
    $(".update-transport").click(function (event) {
        event.preventDefault();

        var updateStatusURL = $(this).attr("href");
        var orderId = $(this).closest("tr").data("order-id");

        var that = this;

        $.ajax({
            type: "POST",
            url: updateStatusURL,
            data: { orderId: orderId },
            success: function () {
                $(that).closest("tr").find(".status").text("Đang vận chuyển");
                console.log("Đang vận chuyển");
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
    $(".update-delivered").click(function (event) {
        event.preventDefault();

        var updateStatusURL = $(this).attr("href");
        var orderId = $(this).closest("tr").data("order-id");

        var that = this;

        $.ajax({
            type: "POST",
            url: updateStatusURL,
            data: { orderId: orderId },
            success: function () {
                $(that).closest("tr").find(".status").text("Đã giao hàng");
                console.log("Đang vận chuyển");
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
});