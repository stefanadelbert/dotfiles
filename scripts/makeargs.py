import os
import sys

def main(argv):
    if len(argv) == 0:
        print ""
        sys.exit(0)
    assert len(argv) == 1, "Can't have more than 1 parameter"
    target = argv[0]

    if os.path.isfile(target):
        filename_prefix = os.path.splitext(target)[0]
        print "{}.o".format(filename_prefix)
    elif os.path.isdir(target):
        # Just build everything in this case. It would be nice to try to identify
        # the correct target based on path of the file.
        print ""
    else:
        # If the target is neither a file nor a directory,
        # just pass it back at it is.
        print "{}".format(target)

if __name__ == "__main__":
    main(sys.argv[1:])
