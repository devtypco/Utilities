if ( -not (test-path "c:\Documents and Settings\All Users\Desktop\New Minerals & Utilities" -PathType Container ))
    {
        MKDIR -Path "C:\Documents and Settings\All Users\Desktop\New Minerals & Utilities"
    }
    else
    {
        write-host "C:\Documents and Settings\All Users\Desktop\New Minerals & Utilities already exists.."
    }