import customtkinter
from PIL import Image

class Windows(customtkinter.CTk):
    def __init__(self, title, size, fullscreen=False, resizable=True):
        super().__init__()

        self.title(title)
        self.geometry(f"{size[0]}x{size[1]}")
        self.attributes('-fullscreen',fullscreen)
        self.resizable(not fullscreen and resizable, not fullscreen and resizable)
        customtkinter.set_appearance_mode("system")