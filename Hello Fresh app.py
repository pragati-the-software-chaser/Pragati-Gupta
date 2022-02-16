from flask import Flask, render_template , request, redirect,session
import service
import os
from datetime import date , timedelta
from random import randint
app = Flask(__name__)


@app.route("/home_page", methods=["GET","POST"])
def home():
    if request.method == "POST":
        req = request.form
        Email=req.get("email")
        Password = req.get("psw")
        if service.checkUserdetails(Email,Password) :
            isemp,depid = service.isEmployee(Email)
            if isemp :
                if depid == 1 :
                    session["Employees"]=service.getAllEmployees()
                    return render_template("/hr_dashboard.html")
                else :
                    session["Products"]=service.getAllproducts()
                    return render_template("/inventory.html")
            else :
                session["emailId"] = Email
                products = service.getAllproducts()
                session["items"] = products
                print("hi i am here")
                print(session["items"])
                return render_template("fruit.html")
        return render_template("login.html")
    if request.method == "GET":
        products = service.getAllproducts()
        session["items"] = products
        return render_template("fruit.html")

@app.route("/")
def login():
    return render_template("login.html")

@app.route("/submit_sign_up", methods=["GET","POST"])
def submit_login():
     if request.method == "POST":
        print(request)
        req = request.form
        print(req)
        E = req.get("email")
        P = req.get("psw")
        N = req.get("name")
        print(E)
        print(P)
        print(N)
        service.addUserdetails(E,P ,N)
     return render_template("login.html")
@app.route("/sign_up")
def sign_up():
     return render_template("customer_sign_up.html")




@app.route("/employee_login")
def employee_login():
    return render_template("emp_sign_up.html")



@app.route("/addCart", methods=["GET","POST"])
def addCart():
    if request.method == "POST":
        req = request.form
        code = req.get("product_id")
        quantity= req.get("pc_qty_quantity")
        print(code)
        product = service.getProductsforCart(code)
        product_list=list(product)
        product_list.append(quantity)
        session.modified = True
        print(session)
        cartItemexist = False
        for key in session.keys() :
            if "cartitems" == key :
                print(key)
                cartItemexist = True
        print(cartItemexist)
        if cartItemexist :
            print(product_list)
            session["cartitems"].append(product_list)
            print(session["cartitems"])
        else :
            items = []
            print(product_list)
            items.append(product_list)
            print(items)
            session["cartitems"] = items
            print(session["cartitems"])
        productTotal = 0
        for items in session['cartitems'] :
            productTotal = productTotal + (int(items[3]) * int(items[9]))
        session['productTotal'] = productTotal
        session['totalAmount'] = productTotal + 10.00
        return render_template("fruit.html")

@app.route("/cart")
def cart():
    today = (date.today()+ timedelta(2)).strftime('%A %d %B %Y')
    print("Today's date:", today)
    session["shippingDate"] = today
    return render_template("shopping_cart.html")

@app.route("/checkout", methods=["GET","POST"])
def checkout():
    if request.method == "POST":
        req = request.form
        print(req)
        session["shippingCharge"] = req.get("shipping_charge_in")
        session["total_cart_amt"] = req.get("total_cart_amt_in")
        session["product_total_amt"] = req.get("product_total_amt_in")
        return render_template("order_confirmation.html")

@app.route("/order_confirmation", methods=["GET","POST"])
def orderConfirmation():
    if request.method == "POST":
        req = request.form
        print(req)
        orderNumber = randint(10000000, 99999999)
        service.addorderInfo(req,session,orderNumber)
        service.addshopping_cart_Info(req,session,orderNumber)
        service.updateInventory(req,session)
        session['orderNumber'] = orderNumber
        session['orderDate'] =  date.today().strftime('%A %d %B %Y')
        session['customerName'] = session["emailId"]
        return render_template("order_confirmation.html")

@app.route("/bookService", methods=["GET","POST"])
def bookingService():
    if request.method == "POST":
        return render_template("bookingPage.html")

@app.route("/queryConfirm", methods=["GET","POST"])
def queryConfirmation():
    if request.method == "POST":
        req = request.form
        print(req)
        service.addQueryInfo(req,session["emailId"])
        session['name'] = req["username"]
        session['emailAddress'] = req["email"]
        session['service'] = req["service"]
        session['query'] = req["query"]
        return render_template("QueryConfirmation.html")

@app.route("/bookingConfirm", methods=["GET","POST"])
def bookingConfirmation():
    if request.method == "POST":
        req = request.form
        print(req)
        bookingNumber = randint(10000000, 99999999)
        service.addBookingInfo(req,session["emailId"],bookingNumber)
        session['bookingNumber'] = bookingNumber
        session['serviceType'] = req["service"]
        session['bookingDate'] = req["bookingDate"]
        return render_template("bookingConfirmation.html")

@app.route("/about_us")
def about():
    return render_template("about_us.html")

@app.route("/contact_us")
def contact():
    return render_template("contact_us.html")

@app.route("/fruit")
def fruit():
    return render_template("fruit.html")

@app.route("/hr_dashboard")
def hr_dashboard():
    if request.method == "GET":
        session["Employees"]=service.getAllEmployees()
        return render_template("/hr_dashboard.html")

@app.route("/add_employee",methods=["GET","POST"])
def hr_dashboard_add_emp():
     if request.method == "POST":
        req = request.form
        print(req)
        service.addEmpdetails(req)
        session["Employees"]=service.getAllEmployees()
        return render_template("/hr_dashboard.html")

@app.route("/update_employee",methods=["GET","POST"])
def hr_dashboard_update_emp():
     if request.method == "POST":
        req = request.form
        print(req)
        service.updateEmpdetails(req)
        session["Employees"]=service.getAllEmployees()
        return render_template("/hr_dashboard.html")

@app.route("/delete_employee",methods=["GET","POST"])
def hr_dashboard_delete_emp():
     if request.method == "POST":
        req = request.form
        print(req)
        service.deleteEmpdetails(req)
        session["Employees"]=service.getAllEmployees()
        return render_template("/hr_dashboard.html")

@app.route("/employee_sign_up", methods=["GET","POST"])
def employee_sign_up():
     if request.method == "POST":
        print(request)
        req = request.form
        print(req)
        E = req.get("email")
        P = req.get("psw")
        N = req.get("name")
        print(E)
        print(P)
        print(N)
        service.addUserdetails(E,P ,N)
        service.updateUsernameforEmp(N,E)
        return render_template("login.html")
     return render_template("emp_sign_up.html")


@app.route("/inventory_dashboard",methods=["GET"])
def inventory_dashboard():
    if request.method == "GET":
        session["Products"]=service.getAllproducts()
        return render_template("/inventory.html")

@app.route("/add_product",methods=["GET","POST"])
def inventory_dashboard_add_product():
     if request.method == "POST":
        req = request.form
        print(req)
        service.addProductdetails(req)
        session["Products"]=service.getAllproducts()
        return render_template("/inventory.html")

@app.route("/update_product",methods=["GET","POST"])
def inventory_dashboard_update_product():
     if request.method == "POST":
        req = request.form
        print(req)
        service.updateProductdetails(req)
        session["Products"]=service.getAllproducts()
        return render_template("/inventory.html")

@app.route("/delete_product",methods=["GET","POST"])
def inventory_dashboard_delete_product():
     if request.method == "POST":
        req = request.form
        print(req)
        service.deletePrductdetails(req)
        session["Products"]=service.getAllproducts()
        return render_template("/inventory.html")
if __name__ == "__main__":
    app.secret_key = os.urandom(24)
    app.run(debug = True, host = "127.0.0.1", port = 8000)