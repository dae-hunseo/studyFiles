def create_list(type = 1, *args):
    if len(args) == 0:
        result = [i for i in 31 if i>0]
    else:
        if type == 2:
            result = [args for i in len(args) if i%2 == 0]
        elif type == 3:
            result = [args for i in len(args) if i%2 == 1]
        elif type == 4:
            result = [args for i in len(args) if i>10]
        elif type == 1:
            result = [args for i in len(args)]
    return result

print(create_list(0))

