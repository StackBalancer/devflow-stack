# pipeline_script.py

import sys

def build():
    print("Building project...")

def test():
    print("Running tests...")

def deploy():
    print("Deploying project...")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        command = sys.argv[1]
        if command == 'build':
            build()
        elif command == 'test':
            test()
        elif command == 'deploy':
            deploy()
        else:
            print(f"Unknown command: {command}")
    else:
        print("No command specified.")
