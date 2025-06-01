#program that encodes all text in a file by shifting characters by one ASCII value, and another program that decodes it.


# with open('Java.txt', 'r') as source, open('Encode_Java.txt', 'w') as destination:
    # while True:
        # char = source.read(1)  # Read one character at a time
        # if not char:  # If no character is read, end of file is reached
            # break
        # # Shift the character by one ASCII value and write to destination
        # destination.write(chr(ord(char) + 1))

with open('Encode_Java.txt', 'r') as source, open('Decode_Java.txt', 'w') as destination:
    while True:
        char = source.read(1)  # Read one character at a time
        if not char:  # If no character is read, end of file is reached
            break
        # Shift the character back by one ASCII value and write to destination
        destination.write(chr(ord(char) - 1))