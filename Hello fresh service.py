import mysql.connector
from datetime import date , timedelta

def addUserdetails(Ee, Pp, Nn):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    add_user = ("INSERT INTO user_details (email_id, user_name, password) VALUES (%s, %s, %s)")
    data_user = (Ee, Nn, Pp)
    cursor.execute(add_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def addEmpdetails(req):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    add_user = ("INSERT INTO employees (email, first_name,last_name,department_id,role_id,s_admin) VALUES (%s, %s,%s,%s,%s,%s)")
    data_user = (req.get('eemail1'),req.get('fname'),req.get('lname'),req.get('dname'),2,req.get('isadmin'))
    cursor.execute(add_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def updateEmpdetails(req):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    update_user = ("UPDATE employees SET first_name = %s,last_name = %s,department_id = %s, s_admin = %s WHERE email = %s")
    data_user = (req.get('fname2'),req.get('lname2'),req.get('dname2'),req.get('isadmin2'),req.get('eemail2'))
    cursor.execute(update_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def updateUsernameforEmp(username,email):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    update_user = ("UPDATE employees SET username = %s WHERE email = %s")
    data_user = (username,email)
    cursor.execute(update_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def deleteEmpdetails(req):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    delete_user = ("DELETE FROM employees WHERE email = %s")
    print(req.get('eemail3'))
    data_user = (req.get('eemail3'),)
    cursor.execute(delete_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def getAllEmployees() :
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    update_query = ("Select * from employees")
    cursor.execute(update_query)
    myresult = cursor.fetchall()
    print(cursor._executed)
    cnx.close()
    return myresult

def updateProductdetails(req):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    update_product = ("UPDATE product SET price = %s,image_location = %s,product_type = %s, store_id = %s WHERE product_name = %s")
    data_product = (req.get('price2'),req.get('imageName2'),req.get('productType2'),'800',req.get('productname2'))
    cursor.execute(update_product,data_product)
    print(cursor._executed)
    cnx.commit()

    select_product = ("SELECT product_id from product where product_name = '{}'".format(req.get('productname2')))
    cursor.execute(select_product)
    print(cursor._executed)
    myresult = cursor.fetchone()
    print(myresult)

    productId = myresult[0]
    add_inv = ("UPDATE inventory set product_quantity = %s where inv_id = %s")
    data_inv = (req.get('quantity2'),productId)
    cursor.execute(add_inv,data_inv)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def addProductdetails(req):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    add_user = ("INSERT INTO product (product_name, price,image_location,product_type,store_id) VALUES (%s, %s,%s,%s,%s)")
    data_user = (req.get('productname'),req.get('price'),req.get('imageName'),req.get('productType'),'800')
    cursor.execute(add_user,data_user)
    print(cursor._executed)
    cnx.commit()

    select_product = ("SELECT product_id from product where product_name = '{}'".format(req.get('productname')))
    cursor.execute(select_product)
    print(cursor._executed)
    myresult = cursor.fetchone()
    print(myresult)

    productId = myresult[0]
    add_inv = ("INSERT INTO inventory (product_quantity, inv_id) VALUES (%s, %s)")
    data_inv = (req.get('quantity'),productId)
    cursor.execute(add_inv,data_inv)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def deletePrductdetails(req):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()

    select_product = ("SELECT product_id from product where product_name = '{}'".format(req.get('productname3')))
    cursor.execute(select_product)
    print(cursor._executed)
    myresult = cursor.fetchone()
    print(myresult)
    productId = myresult[0]

    delete_inv = ("DELETE FROM inventory WHERE inv_id = %s")
    data_inv = (productId,)
    cursor.execute(delete_inv,data_inv)
    print(cursor._executed)
    cnx.commit()

    delete_product = ("DELETE FROM product WHERE product_name = %s")
    data_product = (req.get('productname3'),)
    cursor.execute(delete_product,data_product)
    print(cursor._executed)
    cnx.commit()

    cnx.close()

def getAllproducts() :
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    update_query = ("select * from product p, inventory i where p.product_id = i.inv_id")
    cursor.execute(update_query)
    myresult = cursor.fetchall()
    print(cursor._executed)
    cnx.close()
    return myresult

def isEmployee(email) :
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    update_query = ("Select * from employees where email = '{}'".format(email))
    cursor.execute(update_query)
    myresult = cursor.fetchone()
    print(myresult)
    if myresult != None and len(myresult) > 0 :
        return True,myresult[5]
    return False,0
def checkUserdetails(Ee, Pp):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    add_user = ("Select password from user_details where email_id = '{}'".format(Ee))
    cursor.execute(add_user)
    myresult = cursor.fetchone()
    print(cursor._executed)
    cnx.close()
    if myresult[0] == Pp :
        return True
    else :
        return False



def getProductsforCart(product_id) :
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    add_user = ("select * from product p, inventory i where p.product_id = i.inv_id and product_id = '{}'".format(product_id))
    cursor.execute(add_user)
    myresult = cursor.fetchone()
    print(cursor._executed)
    cnx.close()
    return myresult


def addBillingInfo(form,emailid):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='salon_service')
    cursor = cnx.cursor()
    add_user = ("INSERT INTO billinginfo (EmailId, Address,City,State,Zip,FullName) VALUES (%s, %s,%s, %s,%s, %s)")
    data_user = (emailid, form["address"],form["city"],form["state"],form["zip"],form["firstname"])
    cursor.execute(add_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()



def addQueryInfo(form,emailid):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='salon_service')
    cursor = cnx.cursor()
    add_user = ("INSERT INTO query_details (EmailId, ServiceType,Query) VALUES (%s, %s,%s)")
    data_user = (emailid,form["service"],form["query"])
    cursor.execute(add_user,data_user)
    print(cursor._executed)
    cnx.commit()
    cnx.close()

def addorderInfo(form,session,OrderNumber):

    today = date.today().strftime('%A %d %B %Y')
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    query = ("INSERT INTO order_details (order_total_amount,estimated_date,store_id,order_date,order_ref) VALUES (%s, %s, %s, %s, %s)")
    print(query)
    data = (session["totalAmount"],session["shippingDate"],"800",today,OrderNumber)
    cursor.execute(query,data)
    print(cursor._executed)
    cnx.commit()
    cnx.close()


def addshopping_cart_Info(form,session,OrderNumber):

    today = date.today().strftime('%A %d %B %Y')
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    for item in session['cartitems']:
        add_user = ("INSERT INTO shopping_cart (order_ref,shopping_products_name,product_type,shopping_cart_products_num,quantity,cust_id) VALUES (%s, %s,%s, %s,%s,%s)")
        data_user = (OrderNumber,item[1] ,item[6], item[0],item[9],session["emailId"])
        cursor.execute(add_user,data_user)
        print(cursor._executed)
        cnx.commit()
    cnx.close()


def updateInventory(req,session):
    cnx = mysql.connector.connect(user='root', password='root',host='127.0.0.1',database='hello_fresh')
    cursor = cnx.cursor()
    for item in session['cartitems']:
        updatedQuantity =  item[7] - int(item[9])
        add_user = ("UPDATE inventory set product_quantity = %s where inv_id = %s")
        data_user = (updatedQuantity,item[0])
        cursor.execute(add_user,data_user)
        print(cursor._executed)
        cnx.commit()
    cnx.close()