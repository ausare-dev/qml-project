import http.server
import socketserver
import json
PORT = 8000
class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/api/microphones':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            with open('data.json', 'r', encoding='utf-8') as file:
                data = json.load(file)
                self.wfile.write(json.dumps(data).encode('utf-8'))
        else:
            self.send_error(404, "File not found: %s" % self.path)

with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print(f"Server port: {PORT}")
    httpd.serve_forever()
