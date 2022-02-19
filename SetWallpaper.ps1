<#
.SYNOPSIS
  Set and Force Refresh of Desktop Wallpaper without logoff/logon (always working)
.NOTES
  Function   : SetWallpaper
  File Name  : SetWallpaper.ps1
  Author     : Gushmazuko
.LINK
  Original source: https://c-nergy.be/blog/?p=15291
.EXAMPLE
  powershell "iwr -useb https://github.com/gushmazuko/windows-tips/raw/master/SetWallpaper.ps1 | iex; SetWallpaper -img C:/Users/sysadmin/new-wallpaper.jpg"
#>

function SetWallpaper(){
    Param (
        [string]$img
    )

$code = @' 
    using System.Runtime.InteropServices; 
    namespace Win32{ 
        
        public class Wallpaper{ 
            [DllImport("user32.dll", CharSet=CharSet.Auto)] 
            static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
            
            public static void SetWallpaper(string thePath){ 
                SystemParametersInfo(20,0,thePath,3); 
            }
        }
    } 
'@

    add-type $code 

    #Apply the Change on the system 
    [Win32.Wallpaper]::SetWallpaper($img)
}