from flask import Flask, render_template, request, redirect, session
from flask_mysqldb import MySQL

# app = Flask(__name__)




# # mysql = MySQL(app)

# @app.route('/', methods=['POST'])
# def login():
#     # username = request.form['username']
#     # password = request.form['password']
#     # print(username,password)
#     # cursor = mysql.get_db().cursor()
#     # cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
#     # user = cursor.fetchone()
#     # cursor.close()

#     return render_template("login.html")

# if __name__ == "__main__":
#     # app.run(host='0.0.0.0', debug=True)
#     app.run(debug=True)


from flask import Flask,render_template,request


app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'phms'


mysql = MySQL(app)
@app.route('/')
def first():



    return render_template("login.html")

@app.route('/form_login',methods=["POST","GET"])
def login():
    name1=request.form['username']
    pass1=request.form['pass']
    print(name1,pass1)
    conn = mysql.connection
    cursor = conn.cursor()

    # Execute the query to fetch all users
    cursor.execute('SELECT * FROM users')

    # Fetch all the rows from the result
    users = cursor.fetchall()
    print(users)
    # Close the cursor and connection
    cursor.close()
    conn.close()

    # Print the user details
    # for user in users:
    #     print(user)

    return "<h1>THAPU BRO CORRECT PASSWORD PETU</h1>"
    return 'User details printed in the console.'
    if name1=='supriya' and pass1=='supriya':   
        return render_template("home.html",name=name1)
    else:
        return "<h1>THAPU BRO CORRECT PASSWORD PETU</h1>"
    

if __name__ == "__main__":
    # app.run(host='0.0.0.0', debug=True)
    app.run(debug=True)
