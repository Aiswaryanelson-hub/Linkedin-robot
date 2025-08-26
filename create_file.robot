*** Settings ***
Library    OperatingSystem
Library    Process

*** Variables ***
${FILENAME}    wifi_paragraph.txt
${CONTENT}     Wi-Fi PERFORMANCE TESTING: Discover the potential and limitations of wireless systems through extensive evaluations of speed, coverage, and reliability.\n\nWi-Fi SECURITY TESTING:Count on our experts to conduct extensive security assessments, identify vulnerabilities, and implement effective protection measures to ensure the robust integrity of your network.
${REPO_URL}    https://github.com/Aiswaryanelson-hub/Linkedin-robot.git
${BRANCH}      main

*** Test Cases ***
Create And Push Project
    [Documentation]    Create wifi_paragraph.txt, add all project files, commit and push to GitHub
    Create File    ${FILENAME}    ${CONTENT}
    Run Process    git init    shell=True
    Run Process    git config user.name "Aiswaryanelson"    shell=True
    Run Process    git config user.email "aiswarya.n@thinkpalm.com"    shell=True
    Run Process    git add .    shell=True
    Run Process    git commit -m "Initial commit: project + ${FILENAME}"    shell=True
    Run Process    git branch -M ${BRANCH}    shell=True
    # Safely remove origin (ignore errors if it doesn't exist)
    Run Process    git remote remove origin    shell=True    stderr=STDOUT    stdout=remote_remove.log
    Run Process    git remote add origin ${REPO_URL}    shell=True
    Run Process    git push -u origin ${BRANCH}    shell=True
