*** Settings ***
Library    OperatingSystem
Library    Process

*** Variables ***
${FILENAME}    wifi_paragraph.txt
${NEW_CONTENT}    CONFIGURATION TESTING: Experience customized testing to meet unique requirements, enhancing network performance according to your specifications and ensuring optimal Wi-Fi customization and configuration.\n\nWi-Fi INTERFERENCE TESTING:Navigate and minimize disruptions caused by interference challenges, optimizing signal quality for seamless connectivity through effective testing techniques
${BRANCH}      main

*** Test Cases ***
Update And Push File
    # Pull the latest changes (ensures .robot and txt are up-to-date)
    Run Process    git pull origin ${BRANCH}    shell=True

    # Update the text file
    Remove File    ${FILENAME}
    Create File    ${FILENAME}    ${NEW_CONTENT}

    # Add all files again (so even if you modify .robot files, they go to GitHub)
    Run Process    git add .    shell=True
    Run Process    git commit -m "Updated ${FILENAME} and project files"    shell=True
    Run Process    git push origin ${BRANCH}    shell=True
