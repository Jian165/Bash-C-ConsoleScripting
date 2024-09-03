location="../../Programming/c#"
#message logs
LogSys() 
{
    # Colors
    local CYAN_B="\033[1;46m"
    local magenta="\033[0;35m"
    local yellow="\033[0;33m"
    local green="\033[0;32m"
    local red="\033[0;31m"
    local reset="\033[0m"
    local Message=$2
    local Type=$1
    case $Type in
        1)
        echo -e "${CYAN_B}${Message}${reset}"
        ;;
        2)
        echo -e "${magenta}System:${Message}${reset}"
        ;;
        3)
        echo -e "${yellow}Select:\n${Message}${reset}"
        ;;
        4)
        echo -e "${green}Select:\n${Message}${reset}"
        ;;
        5)
        echo -e "${red}Select:\n${Message}${reset}"
        ;;
    esac
    esac
}

# Check if the directory exsist
CheckDirectory()
{
    local directory=$1
    if [ -d $directory ]; then
        return 0
    else
        return 1
    fi
}

# Configure the project file path
StartConfig()
{
    CheckDirectory $location 
    if [ $? -eq 0 ]; then
        LogSys 2 "C# Directory Exist"
        Menu
    else
        mkdir -p $location
        LogSys 2 "Creating C# Directory..."
        StartConfig
    fi
}
# Open Priject File or Create Project
Menu()
{
    read -p "$( 
    LogSys 3 "1. Create Project\n2.OpenProject\n3.exit\n: ")" selected

    case $selected in
        1)
        LogSys 1 "*** Create Projecti ***"
        ;;
        2)
        LogSys 1 "*** Open Project File ***"
        ;;
        3)
        ;;
        *)
        LogSys 5 "Invalid Input"
    esac

}

LogSys 1 "******* Welcome to My Console IDE *******"
StartConfig
