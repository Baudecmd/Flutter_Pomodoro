from pynput.keyboard import Key, Listener
import pyautogui

def on_press(key):
    if key == Key.tab:
        pyautogui.click()       

def on_release(key):
    if key == Key.esc:
        return False

# Collect events until released
with Listener(
        on_press=on_press,
        on_release=on_release) as listener:
    listener.join()