from pathlib import Path

seen = []
unique_lines = []
hist_file = "{}/.zsh_history".format(str(Path.home()))


with open(hist_file) as hist:
    for line in hist:
        command = line.split(";")[-1].strip()

        if command not in seen:
            seen.append(command)
            unique_lines.append(line)

with open(hist_file, "w") as hist:
    hist.write("".join(unique_lines))
