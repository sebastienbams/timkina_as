package com.google.maps.interfaces 
{
    import flash.text.*;
    
    public interface IClientFactory extends com.google.maps.interfaces.IWrappable
    {
        function createTextField():flash.text.TextField;

        function getSwcVersion():String;
    }
}
