import os
import sys

def main(argv):
    if len(argv) == 0:
        print "-C ../.build"
        assert os.path.basename(os.getcwd()) == 'ASAP', 'Invalid current directory'
        sys.exit(0)

    assert len(argv) == 1, "Can't have more than 1 parameter"

    if os.path.isfile(argv[0]):
        abspath = os.path.abspath(argv[0])
        buildpath = os.path.dirname(abspath).replace("/ASAP/", "/.build/")
        filename = os.path.basename(abspath)
        print "-C {} {}.o".format(buildpath, filename)
    elif os.path.isdir(argv[0]):
        abspath = os.path.abspath(argv[0])
        buildpath = abspath.replace("/ASAP/", "/.build/")
        print "-C {}".format(buildpath)

if __name__ == "__main__":
    main(sys.argv[1:])