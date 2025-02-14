using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Dating._Core.Migrations
{
    /// <inheritdoc />
    public partial class INIT : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CustomerInvoices",
                columns: table => new
                {
                    CustomerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    InvoiceNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    InvoiceEin = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    InvoiceBank = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    InvoiceAccount = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    InvoiceAddress = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    InvoicePhone = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T200_customer_invoice", x => new { x.CustomerNo, x.InvoiceNo });
                });

            migrationBuilder.CreateTable(
                name: "CustomerPwds",
                columns: table => new
                {
                    CustomerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomerPwd = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T101_customer_psw", x => x.CustomerNo);
                });

            migrationBuilder.CreateTable(
                name: "Customers",
                columns: table => new
                {
                    CustomerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomerName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    FirstAreaNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    FirstAreaName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    AreaNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    AreaName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Province = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    City = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Tel = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Phone = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Fax = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Address = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    BankAccount = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    BankNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    BankName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Ein = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    CustomerNote = table.Column<string>(type: "varchar(500)", unicode: false, maxLength: 500, nullable: false),
                    OwnerWorkerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    OwnerWorkerName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    OwnerWorkerTel = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    OpenId = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    HeadImgUrl = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T200_customer_code", x => x.CustomerNo);
                });

            migrationBuilder.CreateTable(
                name: "Menus",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MenuName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    MenuUrl = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ActionName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    ParentMenuId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                });

            migrationBuilder.CreateTable(
                name: "ProductPhotos",
                columns: table => new
                {
                    ProductNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SysNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    ProductPhotoUrl = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T200_product_photo", x => x.ProductNo);
                });

            migrationBuilder.CreateTable(
                name: "Products",
                columns: table => new
                {
                    SysNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductName = table.Column<string>(type: "varchar(200)", unicode: false, maxLength: 200, nullable: false),
                    TypeNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    TypeName = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    ProductPP = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductXH = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductCZ = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductHB = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductHD = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductGY = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductHS = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductMC = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductDJ = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductCD = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductGG = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductYS = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    UnitNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    UnitName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductNote = table.Column<string>(type: "varchar(500)", unicode: false, maxLength: 500, nullable: false),
                    ProductBZGG = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    BelongTypeNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    BelongTypeName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T200_product_code", x => new { x.SysNo, x.ProductNo });
                });

            migrationBuilder.CreateTable(
                name: "ProductSaleAreaDiffs",
                columns: table => new
                {
                    SysNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    StockNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    AreaNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstAreaNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    DiffPrice = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T201_product_sale_area_diff", x => new { x.SysNo, x.ProductNo, x.StockNo, x.AreaNo });
                });

            migrationBuilder.CreateTable(
                name: "ProductSales",
                columns: table => new
                {
                    SysNo = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    ProductNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StockNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    SalePrice = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T201_product_sale_list", x => new { x.SysNo, x.ProductNo });
                });

            migrationBuilder.CreateTable(
                name: "SaleOrderDetails",
                columns: table => new
                {
                    SaleOrderGuid = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    SaleOrderNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    ProductNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    ProductName = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    ProductPhotoUrl = table.Column<string>(type: "varchar(200)", unicode: false, maxLength: 200, nullable: true),
                    CustomerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    InputDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    OrderNum = table.Column<int>(type: "int", nullable: false),
                    BasePrice = table.Column<double>(type: "float", nullable: false),
                    DiffPrice = table.Column<double>(type: "float", nullable: false),
                    SalePrice = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SaleOrderDetails", x => x.SaleOrderGuid);
                });

            migrationBuilder.CreateTable(
                name: "SaleOrderMasters",
                columns: table => new
                {
                    SaleOrderNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    InvoiceNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    InputDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    StockNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    EditUserNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    DeliveryDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    Remark = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SaleOrderMasters", x => x.SaleOrderNo);
                });

            migrationBuilder.CreateTable(
                name: "SaleOrderProgresses",
                columns: table => new
                {
                    SaleOrderNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    ProgressGuid = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StepSn = table.Column<int>(type: "int", nullable: false),
                    StepName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    StepTime = table.Column<DateTime>(type: "datetime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SaleOrderProgresses", x => new { x.SaleOrderNo, x.ProgressGuid });
                });

            migrationBuilder.CreateTable(
                name: "ShoppingCarts",
                columns: table => new
                {
                    CartGuid = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomerNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    ProductNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    ProductNum = table.Column<int>(type: "int", nullable: false),
                    CartSelected = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T200_shopping_cart", x => x.CartGuid);
                });

            migrationBuilder.CreateTable(
                name: "Stocks",
                columns: table => new
                {
                    StockNo = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    StockName = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    StockLinkman = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    StockTel = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false),
                    StockPhone = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_T200_stock_code", x => x.StockNo);
                });

            migrationBuilder.CreateTable(
                name: "UserMenus",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<int>(type: "int", nullable: true),
                    MenuId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserGuid = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserName = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    Password = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    HeadUrl = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: true),
                    IsDel = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.UserGuid);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CustomerInvoices");

            migrationBuilder.DropTable(
                name: "CustomerPwds");

            migrationBuilder.DropTable(
                name: "Customers");

            migrationBuilder.DropTable(
                name: "Menus");

            migrationBuilder.DropTable(
                name: "ProductPhotos");

            migrationBuilder.DropTable(
                name: "Products");

            migrationBuilder.DropTable(
                name: "ProductSaleAreaDiffs");

            migrationBuilder.DropTable(
                name: "ProductSales");

            migrationBuilder.DropTable(
                name: "SaleOrderDetails");

            migrationBuilder.DropTable(
                name: "SaleOrderMasters");

            migrationBuilder.DropTable(
                name: "SaleOrderProgresses");

            migrationBuilder.DropTable(
                name: "ShoppingCarts");

            migrationBuilder.DropTable(
                name: "Stocks");

            migrationBuilder.DropTable(
                name: "UserMenus");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}
