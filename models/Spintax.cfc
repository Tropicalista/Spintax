/**
* The spintax class
*/
component{
	
	/**
	* Constructor
	*/
	any function init(){
		
		return this;
	}

    public string function spin( required string strData ){

        var match = REMatchNoCase( "{(.*?)}", arguments.strData );
        for( m in match ){
            arguments.strData = replace( arguments.strData, m, process( m ) )
        }
        return arguments.strData;
    }

    private string function process( required string strData ){

        // this regex matches {xxx|YYY|aaa}
        var regex = "(?<=\{)(.*?)(?=\})";

        var matches = REMatchGroup( regex, arguments.strData );

        var tmpArr = listToArray( matches[1], "|" );
        createObject( "java", "java.util.Collections" ).Shuffle( tmpArr );

        return tmpArr[1];

    }

    /**
    * Gets the given group of a captured expression.
    *
    * 
    */
    public array function REMatchGroup( required string Pattern, required string Text, numeric Group="0" ) {

        //  Define the local scope. 
        var LOCAL = {};
        /* 
            Create the results array. Here is where we will store
            our captured groups.
        */
        LOCAL.Results = [];
        /* 
            Compile our regular expression pattern. By using the
            underlying Java pattern class, we will have both faster
            pattern matching and more access to the matched groups.
        */
        LOCAL.Pattern = CreateObject(
            "java",
            "java.util.regex.Pattern"
            ).Compile(
                JavaCast( "string", ARGUMENTS.Pattern )
                );
        //  Get our pattern matcher for our target text. 
        LOCAL.Matcher = LOCAL.Pattern.Matcher(
            JavaCast( "string", ARGUMENTS.Text )
            );
        /* 
            Keep looping over the pattern matches until we hit the
            end of the target string.
        */
        while ( condition=LOCAL.Matcher.Find() ) {
            /* 
                Append the target group to the results array. If the
                Group was not defined (defaulting to zero), then the
                entire pattern will be matched.
            */
            ArrayAppend(
                LOCAL.Results,
                LOCAL.Matcher.Group(
                    JavaCast( "int", ARGUMENTS.Group )
                    )
                );
        }
        //  Return the results array. 
        return LOCAL.Results;
    }


}