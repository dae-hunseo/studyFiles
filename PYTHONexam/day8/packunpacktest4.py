import time
def gettime():
    now = time.localtime()
    return now.tm_hour, now.tm_min

result = gettime()
print("지금은 ", result[0], "시", result[1], "분입니다", sep="")

hour, minute = gettime()
print("지금은 ", hour, "시", minute, "분입니다", sep="")

# =============== divmod  ===============
d, m = divmod(7, 3)
print("몫", d)
print("나머지", m)

help(divmod)