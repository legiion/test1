import tkinter as tk

class FullScreenApp:
    def __init__(self, master):
        self.master = master
        master.attributes("-fullscreen", True)

        # Create a frame to hold the centered label
        frame = tk.Frame(master, bg="black")
        frame.pack(fill=tk.BOTH, expand=True)

        # Create the label with centered text
        self.label = tk.Label(frame, text="This is a test page", fg="white", bg="black", font=("Arial", 24))
        self.label.pack(expand=True)

        # Create a close button
        self.close_button = tk.Button(master, text="Close", command=master.quit)
        self.close_button.pack()

        # Bind the keyboard event to prevent Alt+F4
        master.bind("<Alt-F4>", lambda event: None)

if __name__ == "__main__":
    root = tk.Tk()
    app = FullScreenApp(root)
    root.mainloop()
