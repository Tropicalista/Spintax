/**
* A normal ColdBox Event Handler
*/
component{

	property name="spintax" inject="spintax@spintax";

	function index(event,rc,prc){


		var strData = "{Hello|Howdy|Hola} to you, {Mr.|Mrs.|Ms.} {Smith|Williams|Davis}";
		//var strData = "{Hello|Howdy|Hola} to you, {Mr.|Mrs.|Ms.} {{Jason|Malina|Sara}|Williams|Davis}";

		var regex = "(?<=\{)(.*?)(?=\})";

		for(i=1;i LTE 9;i=i+1){
			dump(spintax.spin( strData ));
		}

		f = spintax.spin( strData );

		dump(f);
		abort;

        var match = REMatchNoCase( "{(.*?)}", strData );
        dd = spintax.REMatchGroup( "/\{(((?>[^\{\}]+)|(?R))*)\}/x", strData );
        dump(dd);

        dump(match);
        for( m in match ){
        dd = spintax.REMatchGroup( regex, strData );
        dump(dd);
		jj = listToArray(dd[1],"|");
        spin = CreateObject( "java", "java.util.Collections" ).Shuffle( jj );

            strData = replace(strData, m, jj[1]);
        dump(strData);
        }

        dump(strData);
		//f = rematch(regex,c)
		var f = spintax.REMatchGroup(regex,strData)

		dump(f)


    	//dump(spintax.spin(strData));
		abort;
		event.setView( "home/index" );
	}

}