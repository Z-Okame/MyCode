import threading

def thread_function():
    print("ciao")

thread = threading.Thread(target = thread_function)

thread.start()

thread.join() #sincronizza l'esecuzione