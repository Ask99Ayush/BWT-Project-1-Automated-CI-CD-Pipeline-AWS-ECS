from flask import Flask, jsonify, render_template

app = Flask(__name__)

# Home Page Route
@app.route('/')
def home():
    return render_template('index.html')

# API Route
@app.route('/api')
def api():
    return jsonify({'message': 'Hello from Flask API!'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
